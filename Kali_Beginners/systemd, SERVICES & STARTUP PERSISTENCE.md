# 🐧 LINUX MASTERY

## LESSON 16: systemd, SERVICES & STARTUP PERSISTENCE (BLUE TEAM)

> If cron is **quiet persistence**,
> `systemd` is **permanent persistence**.

Most modern Linux systems use **systemd**. This lesson explains how attackers abuse services for startup persistence — and how Blue Team detects it.

---

## PART 1️⃣ WHAT IS systemd?

### 🔹 Definition

`systemd` is the Linux **init system**.

It:

* starts the operating system
* launches services at boot
* manages background processes
* controls startup behavior

📌 Anything that runs automatically at boot is likely controlled by `systemd`.

---

## PART 2️⃣ WHAT IS A SERVICE?

A **service** is:

* a program
* running in the background
* started automatically or manually

Examples:

* `ssh`
* `cron`
* `networking`

Services often run with **high privileges**.

---

## PART 3️⃣ WHY ATTACKERS LOVE SERVICES

Attackers abuse services because they:

* run as root
* start before user login
* persist across reboots
* look legitimate to administrators

👉 A malicious service is a **perfect backdoor**.

---

## PART 4️⃣ BASIC SERVICE COMMANDS – systemctl

---

### 🔹 List running services

```bash
systemctl list-units --type=service
```

---

### 🔹 List all installed services (active or inactive)

```bash
systemctl list-unit-files --type=service
```

📌 Blue Team prioritizes the **installed services list**.

---

## PART 5️⃣ CHECK A SERVICE (VERY IMPORTANT)

---

### 🔹 Service status

```bash
systemctl status ssh
```

This shows:

* service state
* PID
* start time
* **ExecStart command**

📌 Always inspect **ExecStart** carefully.

---

## PART 6️⃣ ENABLED VS DISABLED SERVICES

---

### 🔹 Enable a service at boot

```bash
systemctl enable servicename
```

---

### 🔹 Disable a service

```bash
systemctl disable servicename
```

🚨 Unexpected enabled services indicate persistence.

---

## PART 7️⃣ WHERE SERVICE FILES LIVE (CRITICAL)

---

### 🔹 Service file locations

```text
/lib/systemd/system/
/etc/systemd/system/
```

📌 `/etc/systemd/system/` overrides all others.

🚨 This is the **most abused persistence location**.

---

## PART 8️⃣ INSPECT SERVICE FILES

---

### 🔹 View a service file

```bash
cat /etc/systemd/system/evil.service
```

Look for:

* `ExecStart` paths
* execution from `/tmp`
* `curl`, `wget`, `bash`
* encoded or obfuscated commands

---

## PART 9️⃣ COMMON ATTACKER SERVICE TRICKS

🚨 Red flags:

* random or misleading service names (`sysupdate.service`)
* `ExecStart` pointing to `/tmp` or hidden files
* base64 encoded commands
* hidden scripts or binaries

Example malicious service:

```ini
[Service]
ExecStart=/tmp/.x
Restart=always
```

---

## PART 🔟 CHECK AUTO-START SERVICES

---

### 🔹 List enabled services

```bash
systemctl list-unit-files --type=service | grep enabled
```

📌 SOC teams check this early.

---

## PART 1️⃣1️⃣ SERVICE LOGS (JOURNAL)

Services log through **journald**.

---

### 🔹 View logs for a service

```bash
journalctl -u ssh
```

Investigate:

* repeated restarts
* crashes
* abnormal activity

---

## PART 1️⃣2️⃣ BLUE TEAM INVESTIGATION FLOW

1️⃣ List enabled services
2️⃣ Identify unknown services
3️⃣ Read the service file
4️⃣ Inspect `ExecStart` paths
5️⃣ Review service logs
6️⃣ Escalate findings

---

## PART 1️⃣3️⃣ SAFE RULES

❌ Do NOT stop services blindly
❌ Do NOT delete service files immediately

✔️ Copy service file for evidence
✔️ Hash associated binaries
✔️ Identify owner and scope

---

## PART 1️⃣4️⃣ SUMMARY TABLE

| Task             | Command                     |
| ---------------- | --------------------------- |
| List services    | `systemctl list-unit-files` |
| Check status     | `systemctl status`          |
| Enabled services | `grep enabled`              |
| Service files    | `/etc/systemd/system/`      |
| Logs             | `journalctl -u`             |

---

> 🛡️ **If malware starts before you log in,**
> it is almost always **cron or systemd**.
