# 🐧 LINUX MASTERY

## LESSON 15: CRON JOBS & SCHEDULED PERSISTENCE (BLUE TEAM)

> If malware runs **every minute or every reboot**,
> there’s a **cron job behind it** more often than not.

This lesson explains how attackers abuse cron for persistence — and how Blue Team detects it.

---

## PART 1️⃣ WHAT IS CRON?

### 🔹 Definition

**Cron** is a Linux job scheduler.

It runs commands:

* automatically
* at fixed times or intervals
* without user interaction

Legitimate uses include:

* backups
* log rotation
* system maintenance

---

## PART 2️⃣ WHY ATTACKERS LOVE CRON

Attackers use cron because:

* it survives reboots
* it runs silently
* it blends in with legitimate tasks
* administrators often forget to audit it

📌 **Cron = silent, reliable persistence**

---

## PART 3️⃣ CRON TIME FORMAT (VERY IMPORTANT)

Cron jobs use **5 time fields + a command**:

```text
* * * * * command
```

| Field | Meaning      |
| ----- | ------------ |
| 1     | minute       |
| 2     | hour         |
| 3     | day of month |
| 4     | month        |
| 5     | day of week  |

---

### 🔹 Example

```text
*/5 * * * * /tmp/.update
```

Meaning:

* runs every 5 minutes
* executes a hidden file from `/tmp`

🚨 **Classic malicious cron pattern**

---

## PART 4️⃣ USER CRONTABS

---

### 🔹 View current user cron jobs

```bash
crontab -l
```

Shows:

* cron jobs for the logged-in user

📌 First place Blue Team checks.

---

### 🔹 Edit user crontab

```bash
crontab -e
```

🚨 Attackers add persistence here.

Blue Team should **not edit casually**.

---

## PART 5️⃣ SYSTEM-WIDE CRON LOCATIONS (CRITICAL)

Attackers don’t always use `crontab`.

### 🔹 Cron directories

```text
/etc/cron.hourly/
/etc/cron.daily/
/etc/cron.weekly/
/etc/cron.monthly/
/etc/cron.d/
```

---

### 🔹 Why `/etc/cron.d/` is high risk

Files in this directory:

* run as root
* don’t require `crontab -e`
* look legitimate

🚨 **Very common persistence location**

---

## PART 6️⃣ VIEW SYSTEM CRON JOBS

---

### 🔹 List cron directories

```bash
ls -la /etc/cron.*
```

---

### 🔹 Inspect cron job files

```bash
cat /etc/cron.d/*
```

Look for:

* strange file names
* hidden paths
* execution from `/tmp`
* `curl`, `wget`, `bash`

---

## PART 7️⃣ COMMON ATTACKER CRON PATTERNS

🚨 Red flags:

* jobs running every minute (`* * * * *`)
* execution from `/tmp` or hidden directories
* jobs downloading payloads
* base64-encoded commands

---

## PART 8️⃣ BLUE TEAM INVESTIGATION FLOW

1️⃣ Check user cron jobs:

```bash
crontab -l
```

2️⃣ Check root cron jobs:

```bash
sudo crontab -l
```

3️⃣ Inspect cron directories:

```bash
ls -la /etc/cron.*
```

4️⃣ Review suspicious cron files:

```bash
cat /etc/cron.d/suspicious
```

---

## PART 9️⃣ SAFE RULES (VERY IMPORTANT)

❌ Do NOT delete cron jobs immediately
❌ Do NOT edit without authorization

✔️ Copy the cron job for evidence
✔️ Identify owner and scope
✔️ Escalate properly

---

## PART 🔟 SUMMARY TABLE

| Item             | Command           |
| ---------------- | ----------------- |
| User cron        | `crontab -l`      |
| Root cron        | `sudo crontab -l` |
| Cron directories | `/etc/cron.*`     |
| Inspect job      | `cat file`        |
| High-risk sign   | runs every minute |

---

> 🛡️ **If malware keeps coming back,**
> always check **cron before anything else**.
