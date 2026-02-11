# 📘 LINUX FROM ZERO

## LESSON 7: LOG FILES & BASIC LOG ANALYSIS (BEGINNER GUIDE)

Logs are the **eyes of the Blue Team**.

---

## PART 1️⃣ WHAT IS A LOG FILE?

A **log file** is a file that records:

* events
* activities
* errors
* user actions
* system actions

Think of logs as:

> 📖 **System diary**

Linux writes logs **automatically**.

---

## PART 2️⃣ WHERE ARE LOGS STORED?

Most Linux logs are stored in:

```text
/var/log
```

This directory is **VERY IMPORTANT**.

---

### 🔹 List log files

```bash
ls /var/log
```

You may see files like:

* `auth.log`
* `syslog`
* `kern.log`
* `dmesg`

For beginners, we focus on **ONLY TWO** logs.

---

## PART 3️⃣ IMPORTANT LOG FILES (BEGINNER LEVEL)

### 1️⃣ `/var/log/auth.log`

#### 🔹 What it records

* user login attempts
* SSH logins
* sudo usage
* authentication failures

📌 **Blue Team uses this DAILY**

---

#### 🔹 Example events

* Failed password
* Successful login
* Unauthorized sudo attempt

---

### 2️⃣ `/var/log/syslog`

#### 🔹 What it records

* system events
* service start/stop
* background processes
* general system messages

📌 Think of it as **system health log**.

---

## PART 4️⃣ VIEWING LOG FILES SAFELY

Logs can be **large**.
So we use safe commands.

---

### 1️⃣ `less` — SAFE LOG VIEWING

#### 🔹 Command

```bash
less /var/log/auth.log
```

Why `less`?

* page by page
* no editing
* safe for beginners

---

#### 🔹 Navigation recap

* ↑ ↓ → scroll
* Space → next page
* `q` → quit

---

## PART 5️⃣ LIVE LOG MONITORING

### 2️⃣ `tail` — VIEW END OF FILE

#### 🔹 Command

```bash
tail /var/log/auth.log
```

Shows **last 10 lines**.

---

### 3️⃣ `tail -f` — LIVE MONITORING (VERY IMPORTANT)

#### 🔹 Command

```bash
tail -f /var/log/auth.log
```

`-f` = follow

This shows:

* new log entries
* in real time

📌 SOC analysts keep this running.

---

#### 🔹 Stop live view

```text
Ctrl + C
```

---

## PART 6️⃣ SEARCHING LOGS (BASIC)

### 4️⃣ `grep` — SEARCH TEXT IN LOGS

#### 🔹 What is `grep`?

Searches for **specific words** inside files.

---

#### 🔹 Basic syntax

```bash
grep "word" filename
```

---

#### 🔹 Example: Find failed logins

```bash
grep "Failed" /var/log/auth.log
```

---

#### 🔹 Case-insensitive search

```bash
grep -i "failed" /var/log/auth.log
```

---

## PART 7️⃣ COMMON LOG KEYWORDS (BEGINNER)

In `auth.log`, look for:

* `Failed`
* `Accepted`
* `Invalid`
* `sudo`

These words indicate **security events**.

---

## PART 8️⃣ BASIC BLUE TEAM SCENARIOS

### 🔹 Scenario 1: Brute-force attack

You see many lines like:

```text
Failed password for root from 192.168.1.10
```

📌 That means:

* someone is guessing passwords

---

### 🔹 Scenario 2: Successful login

```text
Accepted password for user
```

📌 Check:

* IP address
* time
* user

---

## PART 9️⃣ SAFE BEGINNER RULES

1. Never edit log files
2. Use `less`, `tail`, `grep`
3. Watch `/var/log/auth.log` first
4. Live monitor during incidents

---

## PART 🔟 SUMMARY TABLE

| Command            | Purpose          |
| ------------------ | ---------------- |
| `ls /var/log`      | list logs        |
| `less file`        | view logs safely |
| `tail file`        | last lines       |
| `tail -f file`     | live monitoring  |
| `grep "word" file` | search logs      |
| `grep -i`          | ignore case      |

---

