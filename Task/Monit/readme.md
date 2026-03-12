# Monit Configuration for Trisul Service Monitoring

## Overview

This project demonstrates how to configure **process monitoring and automatic recovery** for **Trisul Network Analytics services** using **Monit**.

Monit is a lightweight Linux utility that continuously monitors system services, processes, files, directories, and network resources.

Trisul Network Analytics is a network monitoring and security analytics system that processes large volumes of network traffic.

This configuration ensures that **critical Trisul services are always running**.
If a service stops or crashes, Monit will automatically **restart the service**.

---

# Architecture

The monitoring setup works as follows:

```
+-------------------+
|   Monit Daemon    |
|  (runs every 25s) |
+---------+---------+
          |
          v
+-------------------+
| Check Trisul PIDs |
+---------+---------+
          |
          v
+-------------------+
| If process fails  |
| Restart service   |
+-------------------+
```

Monit periodically checks the **PID files** of the Trisul services.
If the process associated with the PID file is not running, Monit executes the configured **start command**.

---

# Global Configuration

## Run Monit as a Background Daemon

```
set daemon 25
```

This instructs Monit to:

* Run in the background
* Perform service checks every **25 seconds**

---

## Logging

```
set log /var/log/monit.log
```

All monitoring events and service actions are written to:

```
/var/log/monit.log
```

Example log entries:

```
process trisul_cp_router restarted
process trisul_cp_probe failed
```

---

## Identity and State Files

```
set idfile /var/lib/monit/id
set statefile /var/lib/monit/state
```

These files allow Monit to maintain its **unique identity and monitoring state** across reboots.

---

# Event Queue

```
set eventqueue
    basedir /var/lib/monit/events
    slots 100
```

This configuration stores monitoring events if alert delivery fails.

Benefits:

* Prevents event loss
* Stores up to **100 monitoring events**

---

# Web Interface

Monit includes a built-in web interface.

```
set httpd port 2812
    use address 0.0.0.0
    allow 0.0.0.0/0
    allow admin:unpl
```

This enables remote monitoring via browser.

Access the dashboard:

```
http://SERVER-IP:2812
```

Login credentials:

```
username: admin
password: unpl
```

⚠ Security Warning:

Allowing `0.0.0.0/0` means **anyone can access the interface**.
For production environments, restrict access.

Example secure configuration:

```
allow 127.0.0.1
allow admin:StrongPassword
```

---

# Included Configuration Files

```
include /etc/monit/conf.d/*
include /etc/monit/conf-enabled/*
```

These lines allow additional Monit configuration files to be loaded from:

* `/etc/monit/conf.d/`
* `/etc/monit/conf-enabled/`

This makes the monitoring configuration **modular and scalable**.

---

# Monitored Trisul Services

The following Trisul services are monitored.

---

## Router Service

```
check process trisul_cp_router with pidfile /usr/local/var/lib/trisul-hub/domain0/router0/run/trisul_cp_router.pid
 start program = "/usr/local/bin/trisulctl_hub start domain"
 stop program  = "/usr/local/bin/trisulctl_hub stop domain"
```

Function:

* Handles **packet routing within the Trisul hub infrastructure**

---

## Config Service

```
check process trisul_cp_config with pidfile /usr/local/var/lib/trisul-hub/domain0/config0/run/trisul_cp_config.pid
 start program = "/usr/local/bin/trisulctl_hub start domain"
 stop program  = "/usr/local/bin/trisulctl_hub stop domain"
```

Function:

* Manages configuration for the Trisul system.

---

## Hub Service

```
check process trisul_cp_hub with pidfile /usr/local/var/lib/trisul-hub/domain0/hub0/run/trisul_cp_hub.pid
 start program = "/usr/local/bin/trisulctl_hub start domain"
 stop program  = "/usr/local/bin/trisulctl_hub stop domain"
```

Function:

* Core processing engine for network analytics.

---

## Probe Service

```
check process trisul_cp_probe with pidfile /usr/local/var/lib/trisul-probe/domain0/probe0/run/trisul_cp_probe.pid
 start program = "/usr/local/bin/trisulctl_probe start domain"
 stop program  = "/usr/local/bin/trisulctl_probe stop domain"
```

Function:

* Captures network packets and forwards them to the hub.

---

## Flush Service

```
check process trisul_flushd with pidfile /usr/local/var/lib/trisul-hub/domain0/hub0/context0/run/flushd.pid
 start program = "/usr/local/bin/trisulctl_hub start context default@hub0"
 stop program  = "/usr/local/bin/trisulctl_hub stop context default@hub0"
```

Function:

* Flushes analytics data to storage.

---

## TRP Data Pipeline

```
check process trisul_trpd with pidfile /usr/local/var/lib/trisul-hub/domain0/hub0/context0/run/trp.pid
 start program = "/usr/local/bin/trisulctl_hub start domain"
 stop program  = "/usr/local/bin/trisulctl_hub stop domain"
```

Function:

* Handles Trisul data streaming and processing.

---

## Probe Context Service

```
check process trisul with pidfile /usr/local/var/lib/trisul-probe/domain0/probe0/context0/run/trisul-probe.pid
 start program = "/usr/local/bin/trisulctl_hub start context default@probe0"
 stop program  = "/usr/local/bin/trisulctl_hub stop context default@probe0"
```

Function:

* Maintains probe-level context processing.

---

# Testing the Monitoring System

To test the monitoring system, stop one of the services manually.

Example:

```
pkill trisul_cp_hub
```

Check Monit status:

```
monit status
```

Expected behavior:

1. Monit detects the service failure.
2. Monit automatically executes the start command.
3. The service is restarted.

---

# Viewing Logs

```
tail -f /var/log/monit.log
```

Example output:

```
process trisul_cp_probe restarted
process trisul_cp_hub is running
```

---

# Skills Demonstrated

This project demonstrates practical experience in:

* Linux system administration
* Process supervision
* Infrastructure monitoring
* Network analytics service management
* Production service reliability

---

# Future Improvements

Possible enhancements:

* Email alert notifications
* Slack alert integration
* CPU and memory monitoring
* Disk usage monitoring
* Network availability checks
* TLS encryption for Monit web interface

---

# Author

Bala Murugan

Linux Administration | Network Security | Infrastructure Monitoring
