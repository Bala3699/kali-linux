# 📘 LINUX FROM ZERO

## LESSON 6: PERMISSION-BASED SEARCH (`find -perm`)

⚠️ This lesson is **VERY IMPORTANT**
Many malware & backdoors are detected **only by permissions**.

---

## PART 1️⃣ WHY PERMISSION SEARCH MATTERS (FIRST UNDERSTAND)

Attackers:

* drop executable files
* hide them in `/tmp`, `/var`, `/home`
* give **execute permission**

Blue Team:

* looks for **unexpected executable files**

👉 That’s why `-perm` exists.

---

## PART 2️⃣ WHAT IS `-perm`?

### 🔹 `-perm` checks file permissions

Used **with `find`** to locate files by permission bits.

---

## PART 3️⃣ BASIC SYNTAX (MEMORIZE)

```bash
find [path] -perm [mode]
```

---

## PART 4️⃣ EXECUTE PERMISSION BASICS

Recall:

| Permission | Value |
| ---------- | ----- |
| r          | 4     |
| w          | 2     |
| x          | 1     |

`x` = **dangerous when unexpected**

---

## PART 5️⃣ FIND EXECUTABLE FILES (BEGINNER SAFE)

### 1️⃣ Find files with ANY execute permission

```bash
find /tmp -type f -perm /111
```

### 🔍 Meaning (VERY IMPORTANT)

* `/tmp` → search location
* `-type f` → files only
* `-perm /111` → **any execute permission**

`/` means:

> match **ANY** of owner, group, others

So this finds files where:

* owner OR group OR others can execute

---

### 🔥 Why Blue Team uses this

* malware needs execute permission
* scripts dropped in `/tmp` often executable

---

## PART 6️⃣ DIFFERENCE BETWEEN `/111` AND `111`

This is **critical**.

---

### 🔹 `/111` (ANY execute)

```bash
-perm /111
```

✔️ owner **OR** group **OR** others have execute

---

### 🔹 `111` (EXACT match)

```bash
-perm 111
```

✔️ owner AND group AND others execute
❌ rarely used

---

📌 Blue Team mostly uses:

```bash
-perm /111
```

---

## PART 7️⃣ FIND WORLD-WRITABLE FILES (DANGEROUS)

### 2️⃣ World-writable files

```bash
find /tmp -type f -perm /002
```

### 🔍 Meaning

* `2` = write
* `002` = **others can write**

🚨 Very dangerous:

* anyone can modify file
* malware injection risk

---

## PART 8️⃣ COMBINE SEARCH (REALISTIC)

### 🔹 Executable files in `/tmp`

```bash
find /tmp -type f -perm /111
```

---

### 🔹 Executable files modified recently

```bash
find /tmp -type f -perm /111 -mtime -1
```

Meaning:

* executable
* modified in last 24 hours

🔥 This is **real detection logic**

---

## PART 9️⃣ SAFE BLUE TEAM RULES

1. Never start with `/`
2. Always use `-type f`
3. Focus on:

   * `/tmp`
   * `/var`
   * `/home`

---

## PART 🔟 COMMON BEGINNER MISTAKES

❌ Confusing `/111` and `111`
❌ Searching whole system
❌ Ignoring ownership & permissions after finding file

---

## PART 1️⃣1️⃣ WHAT TO DO AFTER FINDING SUSPICIOUS FILE

Beginner Blue Team flow:

1. List permissions

```bash
ls -l suspicious_file
```

2. Check owner
3. Check location
4. **Do NOT execute it**

---

## PART 1️⃣2️⃣ SUMMARY TABLE

| Command      | Purpose        |
| ------------ | -------------- |
| `-perm /111` | any executable |
| `-perm 111`  | exact execute  |
| `-perm /002` | world-writable |
| `-type f`    | files only     |
| `-mtime -1`  | recent changes |

---


