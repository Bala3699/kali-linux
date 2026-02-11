# 📘 LINUX FROM ZERO

## LESSON 10: PROCESS & NETWORK MONITORING (BLUE TEAM)

If log files show you the **past**, then processes and network connections show you the **present**.

This lesson teaches how Blue Team analysts observe **what is running right now** on a system.

Slow. Beginner-safe. Observation first.

---

## PART 1️⃣ WHAT IS A PROCESS?

### 🔹 Simple definition

A **process** is:

> a program that is currently running

Examples:

* A web browser running
* SSH service running
* A background script running
* A malicious program running

Every process has:

* **PID** (Process ID)
* **User** who started it
* **Command** that launched it

📌 Blue Team watches processes to detect **unauthorized or abnormal activity**.

---

## PART 2️⃣ LISTING PROCESSES – `ps`

---

## 1️⃣ `ps` — PROCESS STATUS

### 🔹 Command

```bash
ps
```

### 🔹 What it shows

* Processes running in the **current terminal only**

📌 Useful for quick checks, but **not enough for investigations**.

---

## 2️⃣ `ps aux` (VERY IMPORTANT)

### 🔹 Command

```bash
ps aux
```

### 🔹 What the options mean

* `a` → processes from all users
* `u` → user-oriented output
* `x` → background processes

### 🔹 What it shows

* All running processes
* User running the process
* CPU usage
* Memory usage
* Full command path

📌 **SOC analysts rely on `ps aux` heavily**.

---

## PART 3️⃣ FILTERING PROCESSES WITH `grep`

---

### 🔹 Example: Find SSH-related processes

```bash
ps aux | grep ssh
```

This shows:

* SSH daemon
* Active SSH sessions

---

### 🔹 Remove false match (`grep` itself)

```bash
ps aux | grep ssh | grep -v grep
```

📌 This avoids misleading results.

---

## PART 4️⃣ REAL-TIME PROCESS VIEW – `top`

---

## 3️⃣ `top` — LIVE PROCESS MONITOR

### 🔹 Command

```bash
top
```

### 🔹 What `top` shows

* Processes updating in real time
* CPU usage per process
* Memory usage per process
* System load

### 🔹 Why Blue Team uses `top`

* Detect sudden CPU spikes
* Identify crypto-mining activity
* Spot runaway or suspicious processes

---

### 🔹 Exit `top`

```text
q
```

---

## PART 5️⃣ NETWORK MONITORING – `ss`

`ss` shows **network connections and listening ports**.
It replaces the older `netstat` tool.

---

## 4️⃣ `ss` — SOCKET STATISTICS

### 🔹 Basic command

```bash
ss
```

📌 Not very useful alone.

---

### 🔹 Show listening ports

```bash
ss -l
```

---

### 🔹 Show TCP connections

```bash
ss -t
```

---

### 🔹 Show listening TCP & UDP ports (IMPORTANT)

```bash
ss -tuln
```

### 🔹 Meaning of options

* `t` → TCP
* `u` → UDP
* `l` → listening ports
* `n` → numeric output (no DNS lookup)

📌 This is often the **first command** run during an investigation.

---

## PART 6️⃣ FINDING SUSPICIOUS CONNECTIONS

---

### 🔹 Safe viewing

```bash
ss -tuln | less
```

Look for:

* Unknown ports
* Services you did not configure

---

### 🔹 Find SSH network connections

```bash
ss -t | grep ssh
```

This helps identify:

* Active SSH sessions
* Unexpected remote access

---

## PART 7️⃣ BASIC BLUE TEAM SCENARIOS

---

### 🔹 Scenario 1: High CPU usage

1. Run:

```bash
top
```

2. Observe:

* Process name
* CPU percentage
* User running it

📌 High CPU can be legitimate or malicious — **investigation is required**.

---

### 🔹 Scenario 2: Unexpected open port

1. Run:

```bash
ss -tuln
```

2. Ask:

* Why is this port open?
* Which service is using it?

---

## PART 8️⃣ SAFE BEGINNER RULES

1. Never kill a process blindly
2. Observe before acting
3. High CPU usage ≠ malware always
4. Unknown port ≠ attack always

📌 Blue Team work is about **verification, not panic**.

---

## PART 9️⃣ SUMMARY TABLE

| Command    | Purpose                    |                         |
| ---------- | -------------------------- | ----------------------- |
| `ps aux`   | list all running processes |                         |
| `ps aux`   | grep name                  | find a specific process |
| `top`      | live CPU & memory usage    |                         |
| `ss -tuln` | show open listening ports  |                         |
| `ss -t`    | grep ssh                   | show SSH connections    |

---

> 🛡️ **Processes and ports reveal attacks while they are happening.**
> Blue Team monitors the present — not just the past.
