# 🐧 LINUX MASTERY

## LESSON 12: USERS, GROUPS & IDENTITY (SECURITY CORE)

This lesson is **critical** for Blue Team work.

> Most Linux attacks are **not exploits first** —
> they are **user abuse first**.

Understanding users and identity is understanding **who really controls the system**.

---

## PART 1️⃣ WHAT IS A USER IN LINUX?

### 🔹 Simple definition

A **user** is an identity that:

* logs in
* runs commands
* owns files
* runs processes

Every command on Linux runs as **some user** — even malware.

---

### 🔹 Why Blue Team cares

If an attacker:

* compromises a user account
* escalates privileges

👉 the system is effectively lost unless detected quickly.

---

## PART 2️⃣ TYPES OF USERS (VERY IMPORTANT)

Linux systems contain **three main types of users**.

---

### 🔹 1. Root user

* Username: `root`
* UID: `0`
* Full control over the system

Root can:

* read any file
* delete system files
* install malware
* hide attacker traces

🚨 **Root compromise = critical incident**

---

### 🔹 2. Normal users

* Created for humans
* Limited permissions

Examples:

```
bala
ubuntu
user1
```

Attackers often:

* compromise a normal user
* then escalate privileges to root

---

### 🔹 3. System users

* Created for services
* Not intended for direct login

Examples:

```
www-data
syslog
mysql
```

📌 Malware sometimes disguises itself as a system user.

---

## PART 3️⃣ HOW LINUX IDENTIFIES USERS (UID)

Linux does **not** trust usernames.
It trusts **UIDs (User IDs)**.

---

### 🔹 UID ranges (simple view)

| UID Range | Meaning      |
| --------- | ------------ |
| 0         | root         |
| 1–999     | system users |
| 1000+     | normal users |

📌 Attackers may rename users — UID reveals the truth.

---

## PART 4️⃣ CHECKING USER IDENTITY

---

## 1️⃣ `whoami`

### 🔹 Command

```bash
whoami
```

Shows:

* the current user running the command

📌 Often the **first command** run during investigations.

---

## 2️⃣ `id` (VERY IMPORTANT)

### 🔹 Command

```bash
id
```

Example output:

```
uid=1000(bala) gid=1000(bala) groups=1000(bala),27(sudo)
```

This reveals:

* UID (user identity)
* GID (primary group)
* all group memberships

📌 **One of the most valuable Blue Team commands**.

---

## PART 5️⃣ GROUPS (ACCESS CONTROL)

Groups control:

* file access
* command permissions
* sudo rights

---

### 🔹 Check group membership

```bash
groups
```

Example:

```
bala sudo docker
```

🚨 If an attacker adds themselves to `sudo`, privilege escalation has occurred.

---

## PART 6️⃣ WHO IS LOGGED IN RIGHT NOW?

---

## 3️⃣ `who`

### 🔹 Command

```bash
who
```

Shows:

* logged-in users
* login terminals
* login time
* access method

📌 Helps detect unauthorized or unexpected logins.

---

## PART 7️⃣ USER ACTIVITY HISTORY (BASIC)

---

## 4️⃣ `last`

### 🔹 Command

```bash
last
```

Shows:

* login history
* logout history
* system reboot events

📌 Used to build **attack timelines**.

---

## PART 8️⃣ WHY USERS ARE ATTACKED FIRST

Attackers prefer user accounts because:

* passwords are reused
* phishing is effective
* brute-force attacks work
* no exploit is required

📌 **Most breaches begin with user compromise**.

---

## PART 9️⃣ BLUE TEAM RED FLAGS (BEGINNER LEVEL)

Watch carefully for:

* newly created users
* users suddenly added to `sudo`
* logins at unusual hours
* unknown system users

These are **early indicators** of compromise.

---

## PART 🔟 SAFE BEGINNER RULES

1. Always start with `whoami`
2. Always verify identity using `id`
3. Monitor the `sudo` group closely
4. Never trust a username blindly

---

## PART 1️⃣1️⃣ SUMMARY TABLE

| Command  | Purpose          |
| -------- | ---------------- |
| `whoami` | current user     |
| `id`     | UID and groups   |
| `groups` | group membership |
| `who`    | active sessions  |
| `last`   | login history    |

---

> 🛡️ **Blue Team does not trust names.**
> **Blue Team trusts UID, groups, and behavior.**
