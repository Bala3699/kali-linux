# 📘 LINUX FROM ZERO

## LESSON 11: DISK, MEMORY & SYSTEM HEALTH (BLUE TEAM)

This lesson completes the **core Linux monitoring skills** every Blue Teamer must have.

Blue Team question:

> **“Is the system healthy right now?”**

System health monitoring helps detect:

* ransomware activity
* crypto-miners
* disk abuse
* memory exhaustion
* system overload

Slow, safe, and observation-focused.

---

## PART 1️⃣ WHY SYSTEM HEALTH MATTERS (BLUE TEAM)

Attackers don’t just exploit vulnerabilities — they also:

* fill disks (ransomware)
* consume CPU (crypto-mining)
* eat memory (malware)
* slow systems to hide activity

Monitoring system health allows **early detection** before total failure.

---

## PART 2️⃣ DISK USAGE – `df`

### 🔹 What is `df`?

`df` means **disk free**.
It shows disk usage for mounted filesystems.

---

### 🔹 Basic command

```bash
df
```

Shows:

* mounted disks
* total size
* used space
* available space

---

### 🔹 Human-readable format (IMPORTANT)

```bash
df -h
```

`-h` makes output readable in **MB / GB**.

📌 Blue Teams almost always use `df -h`.

---

### 🔹 Blue Team warning signs

* Disk usage near **100%**
* Root (`/`) partition full
* `/var` growing unusually fast (logs, ransomware)

---

## PART 3️⃣ DIRECTORY SIZE – `du`

### 🔹 What is `du`?

`du` means **disk usage**.
It shows how much space **directories and files** are using.

---

### 🔹 Basic command

```bash
du
```

Not very useful alone because output is large.

---

### 🔹 Human-readable output

```bash
du -h
```

---

### 🔹 Check size of a specific directory

```bash
du -sh /var/log
```

Meaning:

* `s` → summary only
* `h` → human-readable

📌 This helps locate **where disk space is being consumed**.

---

## PART 4️⃣ MEMORY USAGE – `free`

### 🔹 What is `free`?

`free` shows **memory (RAM) usage**.

---

### 🔹 Basic command

```bash
free
```

Shows:

* total memory
* used memory
* free memory

---

### 🔹 Human-readable format

```bash
free -h
```

📌 Blue Team checks this during system slowdowns or incidents.

---

### 🔹 Warning signs

* Very low free memory
* Heavy swap usage
* Sudden memory spikes

These can indicate:

* memory leaks
* malware
* crypto-miners

---

## PART 5️⃣ SYSTEM UPTIME & LOAD – `uptime`

### 🔹 What is `uptime`?

`uptime` shows:

* how long the system has been running
* number of logged-in users
* **load average**

---

### 🔹 Command

```bash
uptime
```

---

### 🔹 Load average (simple explanation)

* Low load → healthy system
* High load → system under stress

📌 Crypto-miners and runaway processes increase load.

---

## PART 6️⃣ BASIC BLUE TEAM SCENARIOS

---

### 🔹 Scenario 1: Ransomware-like behavior

Possible signs:

* disk suddenly full
* many new files created
* `/home` or `/var` growing rapidly

Commands to observe:

```bash
df -h
du -sh /home
du -sh /var
```

---

### 🔹 Scenario 2: Crypto-miner or resource abuse

Possible signs:

* high CPU usage
* high load average
* system very slow

Commands to observe:

```bash
top
uptime
```

---

## PART 7️⃣ SAFE BEGINNER RULES

1. Never delete files immediately
2. Observe disk, memory, and load first
3. Sudden changes matter more than slow growth
4. Always confirm findings before taking action

📌 Blue Team work is about **careful verification**, not panic.

---

## PART 8️⃣ SUMMARY TABLE

| Command      | Purpose                      |
| ------------ | ---------------------------- |
| `df -h`      | disk usage                   |
| `du -sh dir` | directory size               |
| `free -h`    | memory usage                 |
| `uptime`     | system load & runtime        |
| `top`        | live CPU & memory monitoring |

---

> 🛡️ **Healthy systems are harder to hide attacks in.**
> Blue Teams watch health to catch problems early.
