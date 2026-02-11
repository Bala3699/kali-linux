# 📘 Linux From Zero

## LESSON 3: Creating & Viewing Files


---

## PART 1️⃣ What Is a File?

A **file** is how Linux stores:

* Text
* Data
* Scripts
* Logs
* Configuration settings

### Examples

* `notes.txt`
* `logfile.log`
* `script.sh`

📌 In Linux, **almost everything is treated as a file** — even devices and logs.

---

## PART 2️⃣ Creating Files

---

## 1️⃣ `touch` — Create an Empty File

### 🔹 What is `touch`?

`touch` creates a **new empty file**.
If the file already exists, it updates its timestamp.

---

### 🔹 Syntax

```bash
touch filename
```

---

### 🔹 Example

```bash
touch file.txt
```

Check:

```bash
ls
```

Output:

```text
file.txt
```

---

### 🔹 When to Use `touch`

* Creating placeholder files
* Creating log files
* Creating script files before editing

---

## PART 3️⃣ Creating Directories (Folders)

---

## 2️⃣ `mkdir` — Make Directory

### 🔹 What is `mkdir`?

Creates a **new directory (folder)**.

---

### 🔹 Syntax

```bash
mkdir directory_name
```

---

### 🔹 Example

```bash
mkdir logs
```

Check:

```bash
ls
```

Output:

```text
logs
```

---

### 🔹 Create Multiple Directories

```bash
mkdir dir1 dir2 dir3
```

---

### 🔹 Create Nested Directories

```bash
mkdir -p parent/child
```

`-p` means:

* Create parent directory if it doesn’t exist

---

## PART 4️⃣ Viewing File Content

---

## 3️⃣ `cat` — View Small Files

### 🔹 What is `cat`?

`cat` means *concatenate*, but it is commonly used to **display file content**.

---

### 🔹 Syntax

```bash
cat filename
```

---

### 🔹 Example

```bash
cat file.txt
```

If file contains:

```text
Hello Linux
```

Output:

```text
Hello Linux
```

---

### ⚠️ When NOT to Use `cat`

* Very large files
* Log files

Because it prints **everything at once**.

---

## PART 5️⃣ Viewing Large Files Safely

---

## 4️⃣ `less` — Safe File Viewer

### 🔹 What is `less`?

Displays file content **page by page**.

---

### 🔹 Syntax

```bash
less filename
```

---

### 🔹 Example

```bash
less /var/log/syslog
```

---

### 🔹 Controls Inside `less`

| Key   | Action        |
| ----- | ------------- |
| ↑ ↓   | Scroll        |
| Space | Next page     |
| b     | Previous page |
| q     | Quit          |

---

### 🔹 Why Blue Teams Use `less`

* Logs are large
* Safe read-only viewing
* No accidental edits

---

## PART 6️⃣ Clear the Screen

---

## 5️⃣ `clear` — Clean Terminal View

### 🔹 What It Does

Clears the terminal screen.

📌 **It does NOT delete files or commands.**

---

### 🔹 Syntax

```bash
clear
```

---

### 🔹 Shortcut

```bash
Ctrl + L
```

---

### 🔹 When to Use

* After many commands
* During investigations to reduce confusion

---

## PART 7️⃣ Summary Table

| Command    | Purpose                   |
| ---------- | ------------------------- |
| `touch`    | Create empty file         |
| `mkdir`    | Create directory          |
| `mkdir -p` | Create nested directories |
| `cat`      | View small files          |
| `less`     | View large files          |
| `clear`    | Clean terminal            |

---

## ✅ Teaching Complete

You now understand **how to create and safely view files in Linux**.

Next lesson builds on this foundation.

➡️ **Lesson 4: Permissions (`ls -l`, `chmod`)** 🛡️🐧

---

> *Strong Linux skills are built slowly, one command at a time.*
