# 🐧 LINUX MASTERY

## LESSON 18: `auditd`, LOG CORRELATION & ATTACKER TRACES (BLUE TEAM)

> Logs show *what the system says happened*.
> **auditd shows what actually happened**.

This lesson is about **proof, not assumptions**. It teaches how Blue Teams confirm attacker actions with forensic-grade evidence.

---

## PART 1️⃣ WHAT IS `auditd`?

### 🔹 Definition

`auditd` is the **Linux Audit Daemon**.

It records **security-relevant events** at the kernel level, including:

* file access
* file modifications
* command execution
* permission and ownership changes

If an attacker touches:

* `/etc/passwd`
* `/etc/shadow`
* cron or service files
* binaries like `/bin/bash`

👉 `auditd` can record it.

---

## PART 2️⃣ WHY BLUE TEAM USES `auditd`

Traditional logs (`auth.log`, `syslog`) can be:

* deleted
* modified
* incomplete

`auditd`:

* records kernel-level events
* is harder to bypass
* provides **forensic-quality evidence**

📌 SOC teams, incident responders, and courts trust audit logs.

---

## PART 3️⃣ WHERE AUDIT LOGS LIVE

Audit logs are stored at:

```text
/var/log/audit/audit.log
```

This file contains:

* timestamps
* UID and GID
* executed commands
* file paths
* syscall information

🚨 Never edit or truncate this file.

---

## PART 4️⃣ CHECK IF AUDITD IS RUNNING

### 🔹 Command

```bash
systemctl status auditd
```

If `auditd` is inactive, the system has a **major visibility gap**.

---

## PART 5️⃣ SEARCH AUDIT LOGS – `ausearch`

### 🔹 What is `ausearch`?

`ausearch` is used to query audit logs efficiently.

---

### 🔹 Search by rule key

```bash
ausearch -k keyname
```

`-k` filters events by the rule identifier.

---

### 🔹 Search by user ID

```bash
ausearch -ua 1000
```

Shows all actions performed by UID 1000.

📌 Very useful for insider threat and compromised user investigations.

---

### 🔹 Search by time

```bash
ausearch -ts today
```

Filters events based on timeframe.

---

## PART 6️⃣ DEFINE WHAT TO WATCH – `auditctl`

### 🔹 What is `auditctl`?

`auditctl` defines **audit rules** — what events `auditd` should record.

---

### 🔹 Watch `/etc/passwd`

```bash
auditctl -w /etc/passwd -p wa -k passwd_changes
```

Meaning:

* `-w` → watch file
* `-p wa` → write & attribute changes
* `-k` → tag events

This catches:

* user creation
* user deletion
* manual edits

---

### 🔹 Watch `/etc/shadow`

```bash
auditctl -w /etc/shadow -p wa -k shadow_changes
```

Detects password and credential changes.

---

## PART 7️⃣ WATCH COMMAND EXECUTION

### 🔹 Monitor bash execution

```bash
auditctl -w /bin/bash -p x -k bash_exec
```

This records:

* interactive shells
* attacker command execution

---

## PART 8️⃣ COMMON ATTACKER TRACES CAUGHT BY `auditd`

`auditd` can prove:

* who modified `/etc/passwd`
* who ran `useradd` or `usermod`
* who changed cron jobs
* who modified services
* who altered permissions

This is **evidence**, not suspicion.

---

## PART 9️⃣ BASIC LOG CORRELATION (MENTAL MODEL)

Blue Team correlates multiple sources:

* `auth.log` → authentication events
* `audit.log` → exact actions
* `systemd` logs → persistence behavior
* network data → attacker control

📌 A single log can lie.
📌 **Correlation does not.**

---

## PART 🔟 BLUE TEAM INVESTIGATION FLOW (ADVANCED)

1️⃣ Detect suspicious activity
2️⃣ Check `auth.log` for login evidence
3️⃣ Check `audit.log` for executed actions
4️⃣ Identify UID, command, and file paths
5️⃣ Confirm persistence mechanism
6️⃣ Preserve evidence
7️⃣ Escalate according to process

---

## PART 1️⃣1️⃣ SAFE RULES (VERY IMPORTANT)

❌ Do NOT stop `auditd`
❌ Do NOT clear audit logs
❌ Do NOT modify audit rules blindly

✔️ Export logs safely
✔️ Build a timeline
✔️ Escalate findings

---

## PART 1️⃣2️⃣ SUMMARY TABLE

| Tool        | Purpose                |
| ----------- | ---------------------- |
| `auditd`    | record security events |
| `auditctl`  | define audit rules     |
| `ausearch`  | search audit logs      |
| `audit.log` | forensic evidence      |
| `-k`        | rule identifier        |

---

> 🛡️ **Attackers can hide files, cron jobs, and services —**
> **but they cannot hide kernel events.**

That is why `auditd` exists.
