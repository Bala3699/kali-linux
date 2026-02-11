# 📘 Linux From Zero

## LESSON 4: File Permissions & Ownership (Beginner Guide)

> **Slow. Beginner-first. Security-aware.**
> This lesson explains *why* Linux permissions exist and *how* to read and change them safely — a **core skill for Blue Team and Linux security**.

---

## PART 1️⃣ Why Permissions Exist

Linux is a **multi-user system**.

That means:

* Many users can exist on the same system
* Not everyone should access everything

Linux protects files using:

1. **Ownership**
2. **Permissions**

📌 Without permissions, any user could read, modify, or destroy critical system files.

---

## PART 2️⃣ Viewing Permissions — `ls -l`

### 🔹 Command

```bash
ls -l
```

### 🔹 Example Output

```text
-rw-r--r-- 1 user user 1024 Sep 10 test.txt
```

Don’t panic — we will break this down step by step.

---

## PART 3️⃣ Breaking the Permission String

Focus only on:

```text
-rw-r--r--
```

Ignore the **first character** for now.

Split it into **three blocks**:

```text
rw-   r--   r--
```

| Block  | Applies To |
| ------ | ---------- |
| First  | Owner      |
| Second | Group      |
| Third  | Others     |

---

## PART 4️⃣ What Do `r`, `w`, `x` Mean?

| Symbol | Meaning     | File Example      |
| ------ | ----------- | ----------------- |
| `r`    | Read        | View file content |
| `w`    | Write       | Modify file       |
| `x`    | Execute     | Run file          |
| `-`    | Not allowed | Permission denied |

### 🔹 Example Explained

```text
rw- r-- r--
```

Means:

* **Owner** → Read & write
* **Group** → Read only
* **Others** → Read only

---

## PART 5️⃣ Ownership (Who Owns the File)

From:

```text
-rw-r--r-- 1 user user 1024 Sep 10 test.txt
```

Focus on:

```text
user user
```

| Field         | Meaning |
| ------------- | ------- |
| First `user`  | Owner   |
| Second `user` | Group   |

📌 Ownership controls **who can change permissions and content**.

---

## PART 6️⃣ Why Blue Teams Care

Permissions reveal:

* Who can read sensitive data
* Who can modify files
* Who can execute programs

🚨 Many real-world attacks succeed due to **overly-permissive files**.

---

## PART 7️⃣ Numeric Permissions (Beginner Level)

Each permission has a numeric value:

| Permission | Value |
| ---------- | ----- |
| r          | 4     |
| w          | 2     |
| x          | 1     |
| -          | 0     |

Permissions are calculated by **adding values**.

### 🔹 Examples

| Permission | Calculation | Result |
| ---------- | ----------- | ------ |
| rw-        | 4 + 2       | 6      |
| r--        | 4           | 4      |
| r-x        | 4 + 1       | 5      |
| rwx        | 4 + 2 + 1   | 7      |

### 🔹 Full Example

```text
rw-r--r--
```

Owner → 6
Group → 4
Others → 4

👉 Numeric form:

```text
644
```

---

## PART 8️⃣ Changing Permissions — `chmod`

### 🔹 What is `chmod`?

`chmod` means **change mode**.

Used to change file permissions.

### 🔹 Syntax

```bash
chmod number filename
```

### 🔹 Example

```bash
chmod 644 test.txt
```

Meaning:

* Owner → Read & write
* Group → Read
* Others → Read

### 🔹 Another Example

```bash
chmod 700 script.sh
```

Meaning:

* Owner → Full access
* Group → No access
* Others → No access

---

## PART 9️⃣ Changing Ownership — `chown`

### 🔹 What is `chown`?

`chown` means **change owner**.

Used to change who owns a file.

### 🔹 Syntax

```bash
chown user:group filename
```

Usually requires `sudo`.

### 🔹 Example

```bash
sudo chown root:root test.txt
```

Meaning:

* Owner → root
* Group → root

---

## PART 🔟 Very Important Rule (Memorize)

| Task               | Command |
| ------------------ | ------- |
| View permissions   | `ls -l` |
| Change permissions | `chmod` |
| Change ownership   | `chown` |

❌ Never mix these commands.

---

## PART 1️⃣1️⃣ Safe Beginner Practice Flow

1. Check permissions

```bash
ls -l file.txt
```

2. Change permissions

```bash
chmod 644 file.txt
```

3. Verify again

```bash
ls -l file.txt
```

---

## PART 1️⃣2️⃣ Summary Table

| Command | Purpose                |
| ------- | ---------------------- |
| `ls -l` | View permissions       |
| `chmod` | Change permissions     |
| `chown` | Change ownership       |
| `r w x` | Read Write Execute     |
| `644`   | Safe file permission   |
| `700`   | Safe script permission |

---

> *Permissions are the first line of defense in Linux security.*
