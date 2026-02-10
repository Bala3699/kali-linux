# 🐧 LINUX MASTERY

## LESSON 13: USER & GROUP MANAGEMENT + ABUSE DETECTION

> 🔴 Most Linux compromises survive **reboots**
> not because of malware binaries,
> but because of **users and groups**.

This lesson explains **how attackers persist** on Linux by abusing user and group management — and how Blue Team detects it.

---

## PART 1️⃣ WHY USER MANAGEMENT MATTERS (BLUE TEAM VIEW)

Attackers don’t always drop malware.

They often:

* create new users
* add users to `sudo`
* reset passwords
* hide as normal or system users

👉 If you don’t monitor users and groups, **you miss persistence completely**.

---

## PART 2️⃣ USER DATABASE FILES (MUST KNOW)

Linux stores user and group information in **plain text files**.

---

### 🔹 `/etc/passwd`

Contains:

* username
* UID (User ID)
* GID (Group ID)
* home directory
* login shell

Example:

```text
bala:x:1000:1000:Bala:/home/bala:/bin/bash
```

📌 This file is **readable by all users**.

---

### 🔹 `/etc/shadow`

Contains:

* password hashes
* password aging and expiry data

🚨 Only **root** can read this file.

If attackers access `/etc/shadow`, credentials are compromised.

---

### 🔹 `/etc/group`

Contains:

* group names
* GID
* group members

Example:

```text
sudo:x:27:bala
```

📌 Group membership controls privileges.

---

## PART 3️⃣ CREATING USERS – `useradd`

---

### 🔹 Basic user creation

```bash
sudo useradd username
```

This creates:

* a user entry
* **no password**
* often **no home directory**

📌 Attackers frequently create users this way.

---

### 🔹 Proper user creation

```bash
sudo useradd -m username
```

`-m` creates a home directory.

Missing home directories are a **common red flag**.

---

## PART 4️⃣ SETTING OR CHANGING PASSWORDS – `passwd`

---

### 🔹 Set a password for a user

```bash
sudo passwd username
```

---

### 🔹 Change your own password

```bash
passwd
```

🚨 Sudden password changes, especially at odd hours, are suspicious.

---

## PART 5️⃣ MODIFYING USERS – `usermod` (VERY IMPORTANT)

---

### 🔹 Add user to sudo group (privilege escalation)

```bash
sudo usermod -aG sudo username
```

Meaning:

* `-a` → append (do not remove existing groups)
* `-G` → specify group

🚨 This single command turns a normal user into an administrator.

---

### 🔹 Change login shell

```bash
sudo usermod -s /bin/bash username
```

Attackers use this to:

* enable interactive login
* bypass restrictions like `/usr/sbin/nologin`

---

## PART 6️⃣ DELETING USERS – `userdel`

---

### 🔹 Delete a user

```bash
sudo userdel username
```

---

### 🔹 Delete user and home directory

```bash
sudo userdel -r username
```

📌 **Extreme caution**: this destroys evidence.

Blue Team should **investigate before deletion**.

---

## PART 7️⃣ GROUP MANAGEMENT – `groupadd`

---

### 🔹 Create a group

```bash
sudo groupadd groupname
```

Attackers may create:

* fake admin groups
* groups with misleading names

---

## PART 8️⃣ SUDO ACCESS (CRITICAL CHECK)

---

### 🔹 List users with sudo access

```bash
getent group sudo
```

Shows:

* all users who can escalate privileges

📌 SOC teams run this command **frequently**.

---

## PART 9️⃣ COMMON ATTACKER ABUSE PATTERNS

🚨 Red flags to watch for:

* new users with UID ≥ 1000
* unexpected additions to `sudo`
* users without home directories
* shell changed from `/usr/sbin/nologin`
* password resets at unusual times

These often indicate **persistence attempts**.

---

## PART 🔟 BLUE TEAM INVESTIGATION FLOW (BEGINNER)

When user abuse is suspected:

1️⃣ List all users:

```bash
cat /etc/passwd
```

2️⃣ Check sudo membership:

```bash
getent group sudo
```

3️⃣ Review login history:

```bash
last
```

4️⃣ Inspect a specific user:

```bash
id username
```

---

## PART 1️⃣1️⃣ SAFE RULES (VERY IMPORTANT)

❌ Do NOT delete users immediately
❌ Do NOT reset passwords blindly
❌ Do NOT destroy evidence

✔️ Observe carefully
✔️ Document findings
✔️ Escalate according to process

---

## PART 1️⃣2️⃣ SUMMARY TABLE

| Command             | Purpose                     |
| ------------------- | --------------------------- |
| `useradd`           | create user                 |
| `passwd`            | set or change password      |
| `usermod`           | modify user (groups, shell) |
| `userdel`           | delete user                 |
| `groupadd`          | create group                |
| `getent group sudo` | list sudo users             |

---

> 🛡️ **If an attacker survives a reboot,**
> **they probably touched users, groups, or sudo.**
