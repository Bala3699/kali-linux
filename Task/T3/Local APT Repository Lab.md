# Local APT Repository Lab (Using Incus Containers)

## Overview

This lab demonstrates how to build a **local APT package repository** inside containers and configure another server to install packages **only from that internal repository**.

This setup is commonly used in:

* Enterprise Linux environments
* Secure networks without internet access
* Controlled software distribution
* Faster package installations for multiple servers

---

# Architecture

```
                +----------------------+
                |   Repo Server        |
                |                      |
                |  nginx               |
                |  /var/www/html/repo  |
                |  .deb packages       |
                +----------+-----------+
                           |
                        HTTP
                           |
                +----------v-----------+
                |  Client Server       |
                |                      |
                |  apt update          |
                |  apt install         |
                +----------------------+
```

The **repo server** hosts `.deb` packages.

The **client server** installs packages from the internal repository instead of the internet.

---

# Step 1 – Create Containers

Create two containers.

```
incus launch images:ubuntu/22.04 repo-server
incus launch images:ubuntu/22.04 client
```

Verify containers:

```
incus list
```

Example:

```
repo-server   192.168.50.88
client        192.168.50.22
```

---

# Step 2 – Enter the Repository Server

```
incus exec repo-server -- bash
```

Update packages:

```
apt update
```

Install required tools:

```
apt install nginx dpkg-dev -y
```

---

# Step 3 – Create Repository Directory

```
mkdir -p /var/www/html/repo
cd /var/www/html/repo
```

---

# Step 4 – Download a Package

Example package:

```
apt download htop
```

You should see:

```
htop_*.deb
```

---

# Step 5 – Generate Repository Index

APT requires an index file.

```
dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz
```

Repository structure now:

```
/var/www/html/repo
   htop_*.deb
   Packages.gz
```

---

# Step 6 – Configure Nginx

Edit configuration:

```
vi /etc/nginx/sites-enabled/default
```

Modify the location block:

```
location / {
    autoindex on;
}
```

Restart nginx:

```
systemctl restart nginx
```

---

# Step 7 – Verify Repository Server

Test locally:

```
curl http://localhost/repo/
```

Expected output:

```
Index of /repo
htop_*.deb
Packages.gz
```

Test package index:

```
curl http://localhost/repo/Packages.gz
```

---

# Step 8 – Configure the Client

Enter client container:

```
incus exec client -- bash
```

Create a repository configuration file:

```
vi /etc/apt/sources.list.d/localrepo.list
```

Add:

```
deb [trusted=yes] http://192.168.50.88/repo ./
```

---

# Step 9 – Update Package Lists

Run:

```
apt update
```

Expected output:

```
Get:1 http://192.168.50.88 repo Packages
```

This means the client successfully contacted the repository server.

---

# Step 10 – Install a Package

```
apt install htop
```

The client downloads the package from the internal repository.

---

# Step 11 – Verify Repository Usage

On the repo server:

```
tail -f /var/log/nginx/access.log
```

Example log:

```
192.168.50.22 GET /repo/htop_xxx.deb
```

This confirms the client retrieved the package from the local server.

---

# Adding More Packages

On the repo server:

```
cd /var/www/html/repo
apt download nano
```

Regenerate the index:

```
dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz
```

On the client:

```
apt update
```

Now the new package can be installed.

---

# Troubleshooting

## 403 Forbidden

Cause:

* Directory listing disabled

Solution:

```
autoindex on;
```

---

## Malformed entry in sources.list

Ensure the format is exactly:

```
deb [trusted=yes] http://SERVER-IP/repo ./
```

---

## Dependency errors

Packages must match the **same Ubuntu version** as the client system.

Example:

* Ubuntu 22.04 packages for Ubuntu 22.04 clients
* Ubuntu 24.04 packages for Ubuntu 24.04 clients

---

# Final Repository Structure

```
/var/www/html/repo

htop_*.deb
nano_*.deb
Packages.gz
```

---

# Skills Learned

* Container networking
* Internal repository design
* Package indexing
* Web server configuration
* APT repository configuration

These skills are commonly used by Linux administrators and DevOps engineers.

---

# Conclusion

You successfully created:

* A repository server
* A package index
* A client configured to use the internal repository

This architecture allows multiple systems to install packages from a **controlled internal source** instead of external repositories.
