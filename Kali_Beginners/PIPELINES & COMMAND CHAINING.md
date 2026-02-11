# 📘 LINUX FROM ZERO

## LESSON 9: PIPELINES & COMMAND CHAINING (`|`)

This lesson is a **game changer**.
After this, your commands will start looking like a **real Blue Team / SOC analyst’s commands**.

Pipelines are the **glue** that turns simple commands into powerful one-liners.

---

## PART 1️⃣ What Is a Pipeline?

### 🔹 Simple meaning

A **pipeline** sends the output of one command
➡️ as the input to another command.

The symbol used is:

```bash
|
```

Read it as:

> “send output to the next command”

---

## PART 2️⃣ Why Pipelines Matter (Blue Team View)

Logs are:

* large
* noisy
* full of normal activity

Blue Team work is about:

* filtering noise
* focusing on suspicious events
* counting and summarizing activity

📌 SOC analysts **almost never run single commands** — they chain commands together.

---

## PART 3️⃣ Basic Pipeline Syntax (Memorize)

```bash
command1 | command2
```

Meaning:

1. Run `command1`
2. Take its output
3. Pass it to `command2`

Always read pipelines **left → right**.

---

## PART 4️⃣ First Pipeline (Very Basic)

### 🔹 Example

```bash
ls | less
```

### 🔹 What happens

* `ls` lists files
* `less` displays them page by page

### 🔹 Why useful

* Clean viewing
* Safe for large output

---

## PART 5️⃣ `grep` + Pipeline (Core SOC Skill)

### 🔹 Example: View failed logins safely

```bash
grep "Failed" /var/log/auth.log | less
```

### 🔹 Meaning

* Search for failed logins
* View results safely

---

### 🔹 Case-insensitive search with pipeline

```bash
grep -i "failed" /var/log/auth.log | less
```

This is a **very common SOC pattern**.

---

## PART 6️⃣ Counting with Pipelines (`wc`)

### 🔹 What is `wc`?

`wc` = word count

It can count:

* lines
* words
* characters

---

### 🔹 Most used option

```bash
wc -l
```

Counts **number of lines**.

---

### 🔹 Example: Count failed login attempts

```bash
grep -i "failed" /var/log/auth.log | wc -l
```

### 🔹 Why this matters

* Shows attack intensity
* Helps decide severity
* Used in incident reports

This is **real SOC detection logic**.

---

## PART 7️⃣ Noise Removal Using Pipelines

### 🔹 Example: Remove successful logins

```bash
grep -v "Accepted" /var/log/auth.log | less
```

### 🔹 Meaning

* Exclude normal activity
* Focus only on suspicious events

Noise removal is a **key Blue Team skill**.

---

## PART 8️⃣ Multiple Pipelines (Command Chaining)

You can chain more than two commands.

---

### 🔹 Example: Failed logins for root user

```bash
grep -i "failed" /var/log/auth.log | grep "root"
```

### 🔹 Meaning

* Find failed logins
* Filter only attempts against `root`

---

### 🔹 Example: Count root login failures

```bash
grep -i "failed" /var/log/auth.log | grep "root" | wc -l
```

This shows:

* how many times `root` was targeted

🔥 This is **SOC-level thinking**, not beginner Linux anymore.

---

## PART 9️⃣ Safe Rules for Beginners

1. Read pipelines **left to right**
2. Test each command separately if confused
3. Never execute output blindly
4. Use `less` when output is large

---

## PART 🔟 Summary Table

| Command   | Role          |                  
| --------- | ------------- |  
| `         | `             |
| `grep`    | filter output |                  
| `grep -v` | remove noise  |                  
| `wc -l`   | count lines   |                  
| `less`    | safe viewing  |                  

---

> 🛡️ **Pipelines turn Linux commands into Blue Team weapons.**
> Learn them slowly, and they will carry you far in SOC work.
