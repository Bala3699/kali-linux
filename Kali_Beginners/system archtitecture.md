

# 🧠 Linux — System Architecture Fundamentals

This document explains the **fundamental architecture of Linux systems**, including the **kernel, system services, systemd, filesystem interfaces, and package management**.

Understanding these components is essential for anyone learning **Linux administration, DevOps, cybersecurity, or system engineering**.

---

# 🏗 Linux System Architecture

Before learning tools like `systemctl`, `/sys`, `apt`, or `yum`, it is important to understand **how Linux systems are structured internally**.

A useful way to understand Linux architecture is through a **city analogy**.

| City Component | Linux Equivalent |
| -------------- | ---------------- |
| Mayor          | Kernel           |
| Citizens       | Processes        |
| Roads          | File system      |
| Police         | Security system  |
| Power grid     | System services  |
| Control center | systemd          |

In this structure, the **kernel controls the entire system**, coordinating communication between software and hardware.

---

# ⚙️ The Linux Kernel

The **kernel** is the core component of the Linux operating system.

It acts as the **bridge between applications and hardware**.

The kernel manages:

* CPU scheduling
* Memory allocation
* Hardware communication
* Processes
* Networking
* Filesystems
* Device drivers

### Example Command Execution

When a user runs a command like:

```bash
ls
```

The process typically follows this path:

```
User → Shell → Kernel → Hardware
```

Steps involved:

1. The shell receives the command.
2. The kernel creates a process.
3. The kernel interacts with storage devices.
4. The results are returned to the terminal.

---

# 🧭 What is systemd?

`systemd` is the **system and service manager used by most modern Linux distributions**.

It is responsible for:

* System startup
* Managing services
* Running background programs
* Logging system events
* Handling power states

If the **kernel is the engine**, `systemd` acts as the **driver controlling system operations**.

---

# 🚀 Linux Boot Process

When a Linux system starts, several stages occur before the system becomes usable.

Typical boot sequence:

```
1. BIOS / UEFI initialization
2. Bootloader (GRUB)
3. Linux kernel loads
4. systemd initializes
5. System services start
6. Login interface appears
```

The `systemd` service manager plays a key role by starting and managing system services during boot.

---

# 🔧 Understanding Services

A **service** is a program that runs in the background to provide system functionality.

Examples of common Linux services:

| Service | Purpose            |
| ------- | ------------------ |
| SSH     | Remote access      |
| Nginx   | Web server         |
| MySQL   | Database server    |
| Docker  | Container platform |

To view system services:

```bash
systemctl list-units --type=service
```

---

# 📁 The `/sys` Directory

The `/sys` directory is a **virtual filesystem that exposes kernel and hardware information**.

Important characteristics:

* It is **not stored on disk**
* It is generated dynamically by the kernel
* It provides a structured interface for hardware information

To explore the directory:

```bash
ls /sys
```

Typical directories inside `/sys`:

```
block
bus
class
devices
firmware
kernel
module
power
```

Example: Viewing CPU information

```bash
ls /sys/devices/system/cpu
```

---

# 📊 Real-World Analogy for `/sys`

The `/sys` filesystem can be compared to a **live system dashboard**.

Instead of physically inspecting hardware components, the Linux kernel exposes hardware information through `/sys`.

This includes:

* CPU details
* Device drivers
* Hardware configuration
* Power management information

---

# 📂 `/sys` vs `/proc`

Linux exposes system information through two important virtual filesystems.

| Directory | Purpose                                |
| --------- | -------------------------------------- |
| `/proc`   | Process and kernel runtime information |
| `/sys`    | Hardware devices and kernel interfaces |

Example:

View running process information:

```bash
ls /proc
```

View hardware-related information:

```bash
ls /sys
```

---

# 📦 Linux Package Managers

Linux distributions use **package managers** to install, update, and remove software.

A package manager functions similarly to an **application store**, providing access to software repositories.

---

# 📦 `apt` (Debian-Based Systems)

`apt` is used in many Debian-based distributions.

Examples include:

* Ubuntu
* Debian
* Kali Linux
* Linux Mint

Common commands:

Update package list:

```bash
apt update
```

Upgrade installed packages:

```bash
apt upgrade
```

Install software:

```bash
apt install nginx
```

Remove software:

```bash
apt remove nginx
```

Search packages:

```bash
apt search nginx
```

---

# 📦 `yum` and `dnf` (RedHat-Based Systems)

RedHat-based distributions use `yum` or `dnf`.

Examples include:

* Red Hat Enterprise Linux
* CentOS
* Fedora
* Rocky Linux

Example commands:

Update system packages:

```bash
yum update
```

Install software:

```bash
yum install nginx
```

Remove software:

```bash
yum remove nginx
```

Search for packages:

```bash
yum search nginx
```

Modern systems typically use:

```bash
dnf
```

Example:

```bash
dnf install nginx
```

---

# 🔄 `apt update` vs `apt upgrade`

These two commands perform different tasks.

### `apt update`

Updates the **local package index** by checking repository servers for the latest versions.

Example:

```
System checks repository servers for new package versions
```

---

### `apt upgrade`

Installs the **new versions of packages** that were discovered during `apt update`.

---

### Typical Administrative Workflow

Administrators often run:

```bash
apt update && apt upgrade
```

This performs two actions:

1. Refresh package information
2. Install available updates

---

# 🔧 Managing Services with systemd

`systemctl` is used to manage services in systems that use systemd.

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

Enable service at system startup:

```bash
systemctl enable nginx
```

Disable automatic startup:

```bash
systemctl disable nginx
```

Check service status:

```bash
systemctl status nginx
```

---

# 📚 Summary

Key concepts covered in this guide:

* Linux system architecture
* Kernel responsibilities
* systemd service management
* Linux boot process
* `/sys` virtual filesystem
* Differences between `/sys` and `/proc`
* Package management with `apt`, `yum`, and `dnf`
* Managing services with `systemctl`

These fundamentals form the foundation for **advanced Linux administration and system engineering**.

---
