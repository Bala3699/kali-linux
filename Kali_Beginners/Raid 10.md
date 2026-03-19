
# 📀 RAID 10 (Striped Mirrors)

## 📌 Overview

RAID 10 (also written as **RAID 1+0**) is a combination of:

- **RAID 1 (Mirroring)**
- **RAID 0 (Striping)**

It provides both:

```

High Performance + Data Redundancy

```

---

## ⚙️ How RAID 10 Works

RAID 10 works in two steps:

### Step 1 — Mirroring

Disks are grouped into mirrors:

```

Mirror A → Disk1 + Disk2
Mirror B → Disk3 + Disk4

```

### Step 2 — Striping

Data is striped across these mirrors:

```

Block1 → Mirror A
Block2 → Mirror B
Block3 → Mirror A
Block4 → Mirror B

```

---

## 📊 Visualization

### Disk Structure

```

Mirror 1
Disk1 → A
Disk2 → A

Mirror 2
Disk3 → B
Disk4 → B

```

### Data Distribution

```

Original Data: A B C D

Stored As:
Mirror1 → A C
Mirror2 → B D

```

Each mirror contains a duplicate copy of its data.

---

## 🛡️ Failure Tolerance

RAID 10 can handle multiple disk failures depending on which disks fail.

### ✅ Safe Scenario

```

Disk1 FAIL
Disk3 FAIL

```

System still works because:

```

Disk2 → Backup of Disk1
Disk4 → Backup of Disk3

```

### ❌ Failure Scenario

```

Disk1 FAIL
Disk2 FAIL

```

RAID fails because both disks in the same mirror are lost.

---

## 💾 Minimum Disk Requirement

```

Minimum = 4 disks

```

### Storage Calculation

| Total Disks | Usable Storage |
|------------|----------------|
| 4          | 2 disks        |
| 6          | 3 disks        |
| 8          | 4 disks        |

### Formula

```

Usable Storage = N / 2

```

50% of total storage is used for redundancy.

---

## 🚀 Performance

RAID 10 provides:

- **Fast read speed** (parallel access)
- **Fast write speed** (striping advantage)
- **High fault tolerance** (mirroring)

---

## 🏦 Real-World Use Case

RAID 10 is commonly used in systems that require:

```

High Speed + Zero Data Loss

````

### Example

- Banking systems
- Financial databases
- Critical production servers

---

## 🧪 Linux RAID 10 Setup (mdadm)

### Create RAID 10

```bash
sudo mdadm --create --verbose /dev/md3 --level=10 --raid-devices=4 \
/dev/loop0 /dev/loop1 /dev/loop2 /dev/loop3
````

### Format Filesystem

```bash
sudo mkfs.ext4 /dev/md3
```

### Mount RAID

```bash
sudo mkdir /raid10
sudo mount /dev/md3 /raid10
```

---

## 📚 RAID Summary

| RAID Level | Concept           |
| ---------- | ----------------- |
| RAID 0     | Striping          |
| RAID 1     | Mirroring         |
| RAID 5     | Parity            |
| RAID 10    | Mirror + Striping |

---

## ✅ Key Takeaways

* RAID 10 = **Speed + Safety**
* Requires **minimum 4 disks**
* Can survive **multiple failures (if mirrors are intact)**
* Ideal for **critical systems**

---

## 🔚 Conclusion

RAID 10 is one of the most reliable RAID configurations, offering a perfect balance between performance and redundancy. It is widely used in enterprise environments where uptime and data integrity are critical.



