# 📘 LINUX FROM ZERO

## LESSON 8: `grep` — Deep but Beginner‑Friendly (Blue Team)

`grep` is one of the **most important commands in Blue Team work**.

If you understand `grep`, you can:

* detect attacks
* reduce noise in logs
* analyze incidents quickly

This lesson stays **slow, safe, and practical**.

---

## PART 1️⃣ What Is `grep`?

### 🔹 Meaning

`grep` stands for **Global Regular Expression Print**.

Ignore the long name.

👉 In simple words:

> `grep` searches for text inside files

---

## PART 2️⃣ Basic Syntax (Memorize)

```bash
grep [options] "pattern" filename
```

Where:

* `pattern` → the word or text you are looking for
* `filename` → the file to search in

---

## PART 3️⃣ Basic `grep` (Start Here)

### 🔹 Search for a word

```bash
grep "Failed" /var/log/auth.log
```

### 🔹 What this does

* Looks inside `auth.log`
* Prints every line containing **Failed**

### 🔹 Example output

```text
Failed password for root from 192.168.1.10
```

This already shows:

* failed login attempt
* username
* attacker IP address

---

## PART 4️⃣ Case‑Insensitive Search (`-i`)

Log files may contain:

* `Failed`
* `FAILED`
* `failed`

### 🔹 Command

```bash
grep -i "failed" /var/log/auth.log
```

### 🔹 Why `-i` matters

* Ensures you don’t miss events
* Logs are inconsistent in capitalization

📌 **Always use `-i` when searching logs**

---

## PART 5️⃣ Show Line Numbers (`-n`)

### 🔹 Command

```bash
grep -n "failed" /var/log/auth.log
```

### 🔹 Example output

```text
245:Failed password for root from 192.168.1.10
```

### 🔹 Why this is useful

* Helps during investigations
* Makes reporting easier
* Allows fast navigation to exact log entries

---

## PART 6️⃣ Invert Match (`-v`) — Very Important

### 🔹 What `-v` does

Shows lines that **do NOT match** the search pattern.

### 🔹 Example

```bash
grep -v "Accepted" /var/log/auth.log
```

### 🔹 Meaning

* Shows everything **except successful logins**
* Removes noise

📌 Blue Teams use `-v` to focus only on suspicious activity

---

## PART 7️⃣ Count Matches (`-c`)

### 🔹 Command

```bash
grep -c "Failed" /var/log/auth.log
```

### 🔹 What this shows

* Total number of failed login attempts

📌 Used to:

* measure attack intensity
* confirm brute‑force attempts

---

## PART 8️⃣ Searching Multiple Files

### 🔹 Example

```bash
grep "error" /var/log/*.log
```

### 🔹 Meaning

* Searches all `.log` files
* Finds error messages across the system

---

## PART 9️⃣ Combining `grep` Options

### 🔹 Realistic example

```bash
grep -i -n "failed" /var/log/auth.log
```

This:

* ignores case
* shows line numbers
* searches failed logins

---

### 🔹 Noise‑reduction example

```bash
grep -i -v "accepted" /var/log/auth.log
```

Shows:

* only suspicious authentication events

---

## PART 🔟 Basic Blue Team Detection Using `grep`

### 🔹 Detect brute‑force attempts

```bash
grep -i "failed password" /var/log/auth.log
```

### 🔹 Detect sudo abuse

```bash
grep "sudo" /var/log/auth.log
```

These commands are **daily SOC tasks**.

---

## PART 1️⃣1️⃣ Safe Rules for Beginners

1. Always use `-i` for logs
2. Never edit log files
3. If output is large, combine with `less`
4. Understand the output before taking action

---

## PART 1️⃣2️⃣ Summary Table

| Option        | Meaning           |
| ------------- | ----------------- |
| `grep "word"` | search text       |
| `-i`          | ignore case       |
| `-n`          | show line numbers |
| `-v`          | invert match      |
| `-c`          | count matches     |

---

> 🛡️ **Mastering `grep` means mastering visibility.**
> Visibility is the foundation of Blue Team defense.
