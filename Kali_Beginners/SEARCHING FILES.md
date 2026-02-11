# 📘 LINUX FROM ZERO

## LESSON 5: SEARCHING FILES USING `find`

This is **core Blue Team skill**, but we’ll learn it **slowly**.

---

## PART 1️⃣ WHAT IS `find`?

### 🔹 What does `find` do?

`find` searches:

* files
* directories
  inside a given path

Linux **does not have a global search bar** — you use `find`.

---

## PART 2️⃣ BASIC SYNTAX (MEMORIZE THIS)

```bash
find [path] [options]
```

Where:

* `path` → where to search
* `options` → what to search for

---

## PART 3️⃣ SIMPLE SEARCH (NAME)

### 1️⃣ Search by file name

#### 🔹 Command

```bash
find /home -name test.txt
```

#### 🔹 Meaning

* search inside `/home`
* find file named `test.txt`

---

#### 🔹 Case-insensitive search

```bash
find /home -iname test.txt
```

`-iname` ignores uppercase/lowercase.

---

## PART 4️⃣ SEARCH BY TYPE

### 2️⃣ Search only files

```bash
find / -type f
```

| Option | Meaning      |
| ------ | ------------ |
| `f`    | regular file |
| `d`    | directory    |

---

#### 🔹 Search only directories

```bash
find /home -type d
```

---

## PART 5️⃣ SEARCH BY TIME (BEGINNER)

### 3️⃣ Recently modified files

```bash
find / -mtime -1
```

#### 🔹 Meaning

* files modified in last **1 day (24 hrs)**

---

#### 🔹 Other examples

```bash
-mtime 1     # exactly 1 day old
-mtime +7    # older than 7 days
```

---

## PART 6️⃣ LIMIT SEARCH (VERY IMPORTANT)

Searching from `/` is **slow & dangerous**.

#### 🔹 Better practice

```bash
find /home /tmp /var -type f
```

Always limit paths.

---

## PART 7️⃣ COMBINING OPTIONS (BEGINNER SAFE)

#### 🔹 Example

```bash
find /tmp -type f -name test.txt
```

Meaning:

* search `/tmp`
* only files
* named `test.txt`

---

## PART 8️⃣ WHY BLUE TEAM USES `find`

| Use case             | Reason           |
| -------------------- | ---------------- |
| find malware         | suspicious files |
| find changed files   | intrusions       |
| find unknown scripts | persistence      |

---

## PART 9️⃣ COMMON BEGINNER MISTAKES

❌ Searching whole `/` always
❌ Forgetting `-type`
❌ Running as root without reason

---

## PART 🔟 SAFE BEGINNER RULE

Before running `find`:

1. Know the path
2. Limit scope
3. Use `pwd`

---

## PART 1️⃣1️⃣ SUMMARY TABLE

| Command      | Purpose           |
| ------------ | ----------------- |
| `find /path` | search path       |
| `-name`      | search by name    |
| `-iname`     | case-insensitive  |
| `-type f`    | files only        |
| `-type d`    | directories       |
| `-mtime -1`  | modified last day |

---


