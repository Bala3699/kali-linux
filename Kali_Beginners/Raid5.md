# Linux RAID 5 (Parity RAID) — Documentation

This document explains RAID 5 concepts and demonstrates how to create and manage a RAID 5 array using `mdadm` in Linux.

---

# 1. What is RAID 5?

RAID 5 is a storage technique that provides:

- Improved performance
- Fault tolerance
- Efficient storage utilization

It combines:

- **Striping** (like RAID 0 → performance)
- **Parity** (for recovery)

This makes RAID 5 one of the most commonly used RAID levels in enterprise environments.

---

# 2. Parity Concept

RAID 5 uses **parity** to recover lost data when a disk fails.

### Simple Example

```

A = 10
B = 20
Parity = 30

```

If A is lost:

```

A = Parity - B
A = 30 - 20 = 10

```

This recovery mechanism allows RAID 5 to tolerate **one disk failure**.

---

# 3. Data Distribution

RAID 5 distributes both **data and parity** across all disks.

Example with 3 disks:

```

Disk1 → Data   Data   Parity
Disk2 → Data   Parity Data
Disk3 → Parity Data   Data

```

### Key Feature

- Parity is **rotated across disks**
- Prevents bottlenecks
- Improves performance

---

# 4. Disk Failure Handling

If one disk fails:

- System continues running
- Data is reconstructed using parity
- Admin replaces failed disk
- RAID rebuilds automatically

---

# 5. Minimum Disk Requirement

RAID 5 requires at least:

```

3 disks

```

---

# 6. Storage Calculation

Usable storage is calculated as:

```

Usable Storage = (N - 1)

````

Where `N` = number of disks

### Examples

| Total Disks | Usable Storage |
|------------|---------------|
| 3          | 2 disks       |
| 4          | 3 disks       |
| 5          | 4 disks       |

One disk’s space is used for parity.

---

# 7. Creating RAID 5 in Linux

## Step 1 — Create Virtual Disk

```bash
sudo dd if=/dev/zero of=disk3.img bs=1M count=100
````

Attach the disk:

```bash
sudo losetup -fP disk3.img
```

---

## Step 2 — Verify Disks

```bash
lsblk
```

Example:

```
loop0
loop1
loop2
```

---

## Step 3 — Stop Existing RAID (if any)

```bash
sudo mdadm --stop /dev/md1
```

---

## Step 4 — Create RAID 5

```bash
sudo mdadm --create --verbose /dev/md2 --level=5 --raid-devices=3 /dev/loop0 /dev/loop1 /dev/loop2
```

### Command Breakdown

| Option             | Description          |
| ------------------ | -------------------- |
| `mdadm`            | RAID management tool |
| `--create`         | Create RAID array    |
| `/dev/md2`         | RAID device          |
| `--level=5`        | RAID 5               |
| `--raid-devices=3` | Number of disks      |

---

## Step 5 — Check RAID Status

```bash
cat /proc/mdstat
```

Example:

```
md2 : active raid5 loop0 loop1 loop2
```

---

## Step 6 — Format RAID

```bash
sudo mkfs.ext4 /dev/md2
```

---

## Step 7 — Mount RAID

```bash
sudo mkdir /raid5
sudo mount /dev/md2 /raid5
```

Verify:

```bash
df -h
```

---

# 8. Real World Use Cases

RAID 5 is widely used in:

* Enterprise storage systems
* Web hosting servers
* File servers
* Backup storage systems

It provides a balance between:

* Performance
* Redundancy
* Storage efficiency

---

# 9. Security and Forensics Relevance

RAID 5 knowledge is important for:

* Digital forensics investigations
* Data recovery operations
* Incident response
* Enterprise system auditing

Security professionals often need to:

* Rebuild RAID arrays
* Recover lost data
* Analyze storage structures

---

# Summary

This document covered:

* RAID 5 fundamentals
* Parity-based recovery
* Disk failure handling
* Storage calculation
* RAID creation using `mdadm`
* Formatting and mounting RAID arrays


