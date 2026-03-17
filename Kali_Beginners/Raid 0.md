
# 🐧 Linux Storage Fundamentals — RAID 0 (Striping)

This guide explains **RAID 0 (Striping)** and demonstrates how to create a RAID 0 array in Linux using the `mdadm` tool.

RAID 0 is designed to **improve storage performance** by distributing data across multiple disks so they can work **in parallel**.

This lesson includes both the **conceptual explanation** and a **safe practice lab** using virtual disks.

---

# 1. What RAID 0 Does

RAID 0 is commonly known as **Striping**.

Instead of writing all data to a single disk, RAID 0 **splits the data across multiple disks**.

This allows the disks to **read and write simultaneously**, which significantly increases performance.

However, RAID 0 provides **no redundancy or backup**.

---

# 2. Simple Analogy

Imagine copying a **100-page book**.

### One person (single disk)

One person writes all pages:

```

1 → 100

```

This takes longer because one person does all the work.

---

### Two people (RAID 0)

Person 1 writes:

```

1 3 5 7 9

```

Person 2 writes:

```

2 4 6 8 10

```

Now the task finishes **much faster** because the work is divided.

This is how **RAID 0 striping** works.

---

# 3. How RAID 0 Stores Data

Example file:

```

HELLOWORLD

```

RAID 0 splits the data across disks.

Example with two disks:

```

Disk 1 → H L O O L
Disk 2 → E L W R D

```

Both disks process data **at the same time**, improving performance.

---

# 4. Important Warning

RAID 0 provides **no redundancy**.

If **one disk fails**, the entire array becomes unusable.

Example scenario:

```

Disk 1 fails
Disk 2 still exists

````

Because the file pieces were split across disks, the complete file can no longer be reconstructed.

For this reason, RAID 0 is **not used for critical or sensitive data storage**.

---

# 5. Common RAID 0 Use Cases

RAID 0 is used in environments where **speed is more important than data protection**.

Examples include:

- Gaming systems
- Video editing workstations
- High-performance lab environments
- Temporary data processing systems

In production environments, RAID 0 is often combined with **separate backup systems**.

---

# 6. RAID Practice Lab Using Virtual Disks

Most laptops only have a single disk, so creating RAID requires **virtual disks**.

Linux allows this using **loop devices**, which simulate real disks for testing.

---

# Step 1 — Create Virtual Disk Files

Create two disk image files:

```bash
sudo dd if=/dev/zero of=disk1.img bs=1M count=100
sudo dd if=/dev/zero of=disk2.img bs=1M count=100
````

Explanation:

| Option         | Meaning                        |
| -------------- | ------------------------------ |
| `if=/dev/zero` | Input source filled with zeros |
| `of=`          | Output file name               |
| `bs=1M`        | Block size of 1 MB             |
| `count=100`    | Create a 100 MB file           |

These files act as **virtual hard disks**.

---

# Step 2 — Attach Loop Devices

Attach the disk images to loop devices:

```bash
sudo losetup -fP disk1.img
sudo losetup -fP disk2.img
```

Now check available block devices:

```bash
lsblk
```

Example output:

```
loop0
loop1
```

These loop devices behave like **real disks**.

---

# Step 3 — Create the RAID 0 Array

Create a RAID 0 array using `mdadm`:

```bash
sudo mdadm --create --verbose /dev/md0 --level=0 --raid-devices=2 /dev/loop0 /dev/loop1
```

Explanation:

| Option             | Meaning              |
| ------------------ | -------------------- |
| `--create`         | Create a RAID array  |
| `/dev/md0`         | RAID device name     |
| `--level=0`        | RAID 0 configuration |
| `--raid-devices=2` | Number of disks used |

---

# Step 4 — Check RAID Status

Verify the RAID array:

```bash
cat /proc/mdstat
```

Example output:

```
md0 : active raid0 loop0 loop1
```

This confirms the RAID array is active.

---

# Step 5 — Format the RAID Device

Create a filesystem on the RAID device:

```bash
sudo mkfs.ext4 /dev/md0
```

This prepares the RAID device for storing files.

---

# Step 6 — Mount the RAID Array

Create a mount directory:

```bash
sudo mkdir /raid0
```

Mount the RAID device:

```bash
sudo mount /dev/md0 /raid0
```

Verify the mount:

```bash
df -h
```

The RAID array should now appear as a mounted filesystem.

---

# Real-World Scenario

Consider a **video editing company** working with extremely large files.

Each video file might be:

```
100 GB or larger
```

Editors require **very fast storage speeds**.

To achieve this, they may use:

```
RAID 0 with multiple SSD drives
```

This provides extremely fast read/write performance.

However, because RAID 0 has no redundancy, companies usually maintain **separate backup systems**.

---

# Summary

Key points about RAID 0:

* RAID 0 is called **striping**
* Data is **split across multiple disks**
* Provides **high performance**
* Offers **no data protection**
* If one disk fails, **all data is lost**
* Managed in Linux using **mdadm**

---


