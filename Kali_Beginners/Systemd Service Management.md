
# 🐧 Linux Hero Course — Systemd Service Management

This guide explains **systemd service management**, one of the most important components of modern Linux systems.

Understanding systemd allows administrators to:

* Control system services
* Manage system startup
* Run programs in the background
* Automatically restart failed applications
* Configure services to start at boot

This knowledge is essential for **Linux administrators, DevOps engineers, and system engineers**.

---

# 📊 Linux System Management with systemd

`systemd` is the **system and service manager used by most modern Linux distributions**.

It is responsible for controlling:

* System startup
* Background services
* Service dependencies
* System logging
* Power states
* Parallel service initialization

The `systemctl` command is used to interact with systemd.

Example:

```bash
systemctl
```

---

# 📁 Where systemd Service Files Are Stored

Systemd services are defined using **service unit files**.

Common locations:

| Directory             | Purpose                                   |
| --------------------- | ----------------------------------------- |
| `/etc/systemd/system` | Custom services created by administrators |
| `/lib/systemd/system` | Default services installed by packages    |

Example:

```bash
ls /etc/systemd/system
```

Files in this directory define how services are started and managed.

---

# ⚙️ Structure of a systemd Service File

A service file typically follows this structure:

```ini
[Unit]
Description=My Test Service
After=network.target

[Service]
ExecStart=/usr/bin/python3 /opt/app.py
Restart=always
User=root

[Install]
WantedBy=multi-user.target
```

Each section controls a different aspect of the service.

---

# 🔹 `[Unit]` Section

The `[Unit]` section describes the service and defines startup dependencies.

Example:

```ini
[Unit]
Description=My Test Service
After=network.target
```

Explanation:

| Directive     | Purpose                            |
| ------------- | ---------------------------------- |
| `Description` | Human-readable service description |
| `After`       | Defines service startup order      |

Example meaning:

```
Start this service after the network is available.
```

---

# 🔹 `[Service]` Section

This section defines **how the service runs**.

Example:

```ini
[Service]
ExecStart=/usr/bin/python3 /opt/app.py
Restart=always
User=root
```

Explanation:

| Directive   | Purpose                               |
| ----------- | ------------------------------------- |
| `ExecStart` | Command used to start the service     |
| `Restart`   | Defines restart behavior              |
| `User`      | Specifies which user runs the service |

Example behavior:

```
Run a Python application and restart it automatically if it crashes.
```

---

# 🔹 `[Install]` Section

The `[Install]` section controls **when the service starts during system boot**.

Example:

```ini
[Install]
WantedBy=multi-user.target
```

Meaning:

```
Start this service when the system enters the multi-user state.
```

`multi-user.target` represents a **standard non-graphical system environment**.

---

# 🚀 Creating a Custom systemd Service

Administrators can create custom services to run scripts or applications automatically.

### Step 1 — Create the Service File

```bash
sudo nano /etc/systemd/system/test.service
```

Example service configuration:

```ini
[Unit]
Description=Test Service

[Service]
ExecStart=/bin/bash -c "while true; do echo Hello; sleep 5; done"

[Install]
WantedBy=multi-user.target
```

This service continuously prints a message every 5 seconds.

---

### Step 2 — Reload systemd

After creating or modifying a service file, systemd must reload its configuration.

```bash
sudo systemctl daemon-reload
```

This command refreshes systemd’s internal service configuration.

---

### Step 3 — Start the Service

```bash
sudo systemctl start test
```

This starts the service immediately.

---

### Step 4 — Enable Service at Boot

```bash
sudo systemctl enable test
```

This ensures the service automatically starts during system boot.

---

### Step 5 — Check Service Status

```bash
systemctl status test
```

This command displays:

* Service state
* Process ID
* Logs
* Execution status

---

# 🔄 Why `daemon-reload` Is Required

Systemd **caches service configuration files**.

When a new service file is created or edited, the system must reload its configuration to detect changes.

Command:

```bash
systemctl daemon-reload
```

Without running this command, systemd may not recognize new or modified services.

---

# 🔧 Common systemctl Commands

Start a service:

```bash
systemctl start nginx
```

Stop a service:

```bash
systemctl stop nginx
```

Restart a service:

```bash
systemctl restart nginx
```

Enable service at boot:

```bash
systemctl enable nginx
```

Disable service at boot:

```bash
systemctl disable nginx
```

Check service status:

```bash
systemctl status nginx
```

List running services:

```bash
systemctl list-units --type=service
```

---

# 📚 Summary

Key concepts covered in this guide:

* What systemd is and how it manages Linux systems
* Locations of systemd service files
* Structure of a systemd service unit
* The roles of `[Unit]`, `[Service]`, and `[Install]`
* Creating and managing custom services
* Reloading systemd configuration
* Using `systemctl` to manage services

These skills are essential for **Linux system administration and infrastructure management**.

