# 🐧 Linux Storage Fundamentals — Introduction to RAID

This guide introduces **RAID (Redundant Array of Independent Disks)** and explains why it is used in modern Linux systems and enterprise servers.

RAID is commonly used by **system administrators, DevOps engineers, and security professionals** to improve storage **performance, reliability, and fault tolerance**.

---

# 1. The Problem RAID Solves

Imagine you run a **small company website server**.

The server stores:

- Website files
- Databases
- User uploads
- Application logs

All of this data is stored on a **hard disk**.

However, hard disks can **fail unexpectedly**.

If a disk fails:

- The website goes offline
- Data may be permanently lost
- The organization may lose money and reputation

Because of this risk, system administrators use techniques to make **data storage safer and more reliable**.

One of the most common solutions is **RAID**.

---

# 2. What RAID Means

RAID stands for:

**Redundant Array of Independent Disks**

Breaking it down:

| Term | Meaning |
|-----|--------|
| Redundant | Extra copies for reliability |
| Array | A group or collection |
| Independent Disks | Multiple physical drives |

In simple terms:

**RAID combines multiple disks to work together as a single storage system to improve performance or data protection.**

---

# 3. Simple Analogy — Filing Cabinets

Imagine storing **important documents** in an office.

### Without RAID

All documents are stored in **one cabinet**.

If the cabinet is damaged or destroyed:

🔥 All documents are lost.

---

### With RAID

Documents are stored in **multiple cabinets**.

Now:

- If one cabinet fails → copies still exist
- Documents can be split across cabinets → faster access

RAID works similarly with **hard drives**.

---

# 4. Common RAID Levels

There are several RAID configurations, each designed for different goals such as **speed, redundancy, or both**.

| RAID Level | Description |
|-----------|-------------|
| RAID 0 | Data is split across disks for increased speed |
| RAID 1 | Data is mirrored across disks for redundancy |
| RAID 5 | Data and parity information distributed across disks |
| RAID 10 | Combination of RAID 0 and RAID 1 |

Each RAID level balances **performance, storage capacity, and fault tolerance differently**.

---

# 5. Real-World Example

Consider a **banking system**.

The database stores:

- Customer account numbers
- Balances
- Transactions
- Payment history

If a disk fails and data is lost:

💰 The financial institution could lose millions and compromise customer trust.

To prevent this, banks often use **RAID 1, RAID 5, or RAID 10** to ensure data remains available even if a disk fails.

---

# 6. RAID Management in Linux

Linux systems manage RAID arrays using a tool called:

**`mdadm`**

`mdadm` allows administrators to:

- Create RAID arrays
- Monitor RAID health
- Repair degraded arrays
- Manage disk failures
- Rebuild storage arrays

This tool is commonly used in Linux distributions including **Kali Linux, Ubuntu, and Debian**.

---

# 7. Installing and Verifying mdadm

First check whether the `mdadm` tool is installed.

```bash
which mdadm
````

If the command returns no output, install it using:

```bash
sudo apt update
sudo apt install mdadm
```

Verify the installation:

```bash
mdadm --version
```

Example output:

```
mdadm - v4.x
```

---

# 8. Checking Available Disks

To view all available disks and partitions in Linux, use:

```bash
lsblk
```

Example output:

```
sda
├─sda1
└─sda2
sdb
sdc
```

Explanation:

| Disk | Description     |
| ---- | --------------- |
| sda  | Primary disk    |
| sdb  | Secondary disk  |
| sdc  | Additional disk |

These disks can later be used to create **RAID arrays**.

---

# 9. Why Security Professionals Learn RAID

RAID knowledge is also useful for **ethical hackers and security engineers**.

Reasons include:

* Many enterprise servers store data on RAID arrays
* Security logs are often stored on RAID storage
* Incident response investigations may require RAID data recovery
* Understanding RAID helps analyze enterprise infrastructure

For professionals working with **servers, data centers, or forensic investigations**, RAID knowledge is an important skill.

---

# 10. Summary

Key points from this lesson:

* RAID uses **multiple disks combined into a single storage system**
* It improves **performance, reliability, or both**
* RAID protects against **disk failure**
* Linux manages RAID using the **mdadm tool**
* Commands like `lsblk` help identify disks available for RAID configuration

