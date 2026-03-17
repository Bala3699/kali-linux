
# 🐧 Linux Storage Fundamentals — RAID 1 (Mirroring)

This guide explains **RAID 1 (Mirroring)** and demonstrates how to create a RAID 1 array in Linux using the `mdadm` tool.

RAID 1 is one of the most commonly used RAID configurations in **enterprise servers** because it provides **data redundancy and fault tolerance**.

---

# 1. What RAID 1 Does

RAID 1 is known as **Mirroring**.

In this configuration, the system writes the **same data to two or more disks simultaneously**.

Example:

```

Disk 1 → File A
Disk 2 → File A (copy)

```

Both disks always contain **identical data**.

This ensures that if one disk fails, the data is still available from the other disk.

---

# 2. Simple Analogy

Imagine writing **important notes**.

Instead of writing them in only **one notebook**, you write the same notes in **two notebooks**.

```

Notebook 1 → original
Notebook 2 → backup copy

```

If one notebook is lost or damaged:

- The second notebook still contains the same information.

This is how **RAID 1 mirroring** works.

---

# 3. How RAID 1 Stores Data

Example file:

```

secret.txt

```

In RAID 1, the data is stored like this:

```

Disk1 → secret.txt
Disk2 → secret.txt

```

Both disks contain the **exact same copy of the data**.

Whenever the system writes new data, it writes it to **all disks in the mirror**.

---

# 4. What Happens If a Disk Fails

Example scenario:

```

Disk1 → FAILED
Disk2 → WORKING

````

System behavior:

- The server **continues running normally**
- Data is still accessible
- The RAID array enters a **degraded state**

An administrator can then replace the failed disk, and the RAID system will **rebuild the mirror automatically**.

---

# 5. Real-World Example

Consider a **hospital database server**.

It stores critical data such as:

- Patient records
- Prescriptions
- Test results
- Medical history

If the disk fails and data becomes unavailable, patient care could be affected.

For this reason, hospitals often use **RAID 1 or RAID 10** to ensure data availability.

---

# 6. Hands-On Lab — Creating RAID 1 in Linux

In this lab, RAID 1 is created using **virtual loop disks**, which simulate physical disks.

This approach allows safe testing on systems that only have one physical disk.

---

## Step 1 — Stop Previous RAID (if running)

If a previous RAID array exists, stop it:

```bash
sudo mdadm --stop /dev/md0
````

---

## Step 2 — Create RAID 1 Array

Create a RAID 1 array using two loop devices:

```bash
sudo mdadm --create --verbose /dev/md1 --level=1 --raid-devices=2 /dev/loop0 /dev/loop1
```

Explanation:

| Option                  | Meaning                     |
| ----------------------- | --------------------------- |
| `--create`              | Create a RAID array         |
| `/dev/md1`              | RAID device name            |
| `--level=1`             | RAID 1 (mirroring)          |
| `--raid-devices=2`      | Number of disks used        |
| `/dev/loop0 /dev/loop1` | Disks included in the array |

---

## Step 3 — Check RAID Status

Verify that the RAID array is active:

```bash
cat /proc/mdstat
```

Example output:

```
md1 : active raid1 loop0 loop1
```

This confirms that the RAID 1 array is functioning.

---

## Step 4 — Format the RAID Device

Create a filesystem on the RAID device:

```bash
sudo mkfs.ext4 /dev/md1
```

This prepares the RAID device for file storage.

---

## Step 5 — Mount the RAID Array

Create a mount directory:

```bash
sudo mkdir /raid1
```

Mount the RAID array:

```bash
sudo mount /dev/md1 /raid1
```

Verify the mount:

```bash
df -h
```

The RAID array should appear as a mounted filesystem.

---

## Step 6 — Test Mirroring

Create a test file in the mounted RAID directory:

```bash
echo "RAID TEST" | sudo tee /raid1/test.txt
```

This file is automatically written to **both disks** in the RAID mirror.

---

# 7. Why Security Engineers Learn RAID 1

Understanding RAID is important for **security professionals and system engineers**.

During activities such as:

* Incident response
* Digital forensics
* Server recovery
* Infrastructure audits

Engineers may encounter systems using RAID arrays.

Knowledge of RAID helps with:

* Understanding enterprise storage architecture
* Rebuilding degraded RAID arrays
* Recovering important data from damaged systems

---

# Summary

Key points about RAID 1:

* RAID 1 is called **mirroring**
* Data is stored as **identical copies across multiple disks**
* Provides **high reliability and fault tolerance**
* The system continues operating if one disk fails
* Managed in Linux using the **mdadm tool**

---
