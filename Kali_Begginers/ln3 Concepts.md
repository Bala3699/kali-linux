# 🐧 Linux Commands Mastery

A **hands-on Linux command-line training repository** focused on accuracy, discipline, and real-world security thinking. This is not a cheat sheet — it is a **skill-building log** designed for cybersecurity and SOC foundations.

---

# 📝 Lesson 1 – Linux Fundamentals Evaluation

## ✅ Concepts Covered

### `ls -l` vs `ls -la`

* `ls -l` → Long format listing
* `ls -la` → Long format listing **including hidden files**

📌 Hidden files often store:

* Configuration files
* SSH keys (`.ssh/`)
* Persistence mechanisms
* Malware artifacts

---

### Importance of `/var/log`

* Authentication logs
* System events
* Service logs
* Attack and incident evidence

📌 `/home` = user data
📌 `/var/log` = **forensics & detection**

SOC analysts rely heavily on this directory.

---

### Danger of `rm -rf *`

* Recursive + force deletion
* No confirmation
* No recovery

🚨 Risks:

* System destruction (if run in `/`)
* Evidence loss during incidents
* Irreversible outages

---

### Root User Risk

* Accidental deletion
* Service outage
* Misconfiguration
* Evidence destruction

✅ Best practice:

* Work as normal user
* Use `sudo` only when required

> *Root is power. Power without discipline is destruction.*

---

## 🏆 Lesson 1 Result

**Status:** PASS ✅
**Focus Areas to Improve:**

* Command accuracy
* File search & counting (`grep`, `wc`, `sort`)

---

# 🔓 Lesson 2 – Files, Ownership & Permissions

This lesson focuses on **how attackers hide and persist** and how defenders detect them.

---

## 1️⃣ File Ownership

```bash
ls -l
```

Example:

```text
-rwxr-x--- 1 root admin 4096 script.sh
```

| Field | Meaning |
| ----- | ------- |
| root  | Owner   |
| admin | Group   |

📌 Ownership defines who can **modify, execute, or delete** files.

---

## 2️⃣ Permission Structure

```text
-rwxr-xr--
```

| Entity | Permissions |
| ------ | ----------- |
| Owner  | rwx         |
| Group  | r-x         |
| Others | r--         |

| Symbol | Meaning |
| ------ | ------- |
| r      | Read    |
| w      | Write   |
| x      | Execute |

---

## 3️⃣ `chmod` – Change Permissions

### Numeric Method

```bash
chmod 755 file.sh
```

| Number | Permission |
| ------ | ---------- |
| 7      | rwx        |
| 5      | r-x        |
| 5      | r-x        |

📌 Executable permissions are commonly abused by malware.

---

## 4️⃣ `chown` – Change Ownership

```bash
chown root:root file.sh
```

🚨 Attackers may change ownership to root to **hide malicious files**.

---

## 5️⃣ Blue Team Detection Commands

Find executable files:

```bash
find / -type f -perm /111
```

Find recently modified files:

```bash
find / -mtime -1
```

These commands are critical during **incident response**.

---



## 📌 Author

**Bala Murugan**
Focus: Linux Command Mastery for Cybersecurity & SOC

---

> *Strong defenders are built in the terminal, one command at a time.*
