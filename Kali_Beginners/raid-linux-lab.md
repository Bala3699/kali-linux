# Linux RAID Lab Documentation

This documentation explains the basics of RAID and demonstrates how to create and manage RAID arrays using `mdadm` in Linux.

---

# 1. What is RAID?

**RAID** stands for:

```

Redundant Array of Independent Disks

```

RAID combines multiple disks into a single logical unit to improve:

- Performance
- Data redundancy
- Fault tolerance

RAID is widely used in servers and datacenters.

---

# 2. RAID 0 (Striping)

## Concept

RAID 0 distributes data across multiple disks to increase read and write speed.

Example:

```

Disk1 → Part of file
Disk2 → Another part of file

```

Both disks operate simultaneously, improving performance.

### Important Warning

RAID 0 provides **no redundancy**.

If one disk fails:

```

All data is lost

````

### Common Use Cases

- Gaming systems
- Video editing workstations
- Temporary high-speed storage
- Lab environments

---

# 3. Creating Virtual Disks for Testing

Since most systems have only one physical disk, we create virtual disks using loop devices.

## Create Disk Images

```bash
sudo dd if=/dev/zero of=disk1.img bs=1M count=100
sudo dd if=/dev/zero of=disk2.img bs=1M count=100
````

This creates two 100MB virtual disks.

---

## Attach Loop Devices

```bash
sudo losetup -fP disk1.img
sudo losetup -fP disk2.img
```

Check devices:

```bash
lsblk
```

You should see:

```
loop0
loop1
```

---

# 4. Creating RAID 0

Create the RAID array:

```bash
sudo mdadm --create --verbose /dev/md0 --level=0 --raid-devices=2 /dev/loop0 /dev/loop1
```

### Command Breakdown

| Option             | Description        |
| ------------------ | ------------------ |
| `mdadm`            | Linux RAID manager |
| `--create`         | Create RAID array  |
| `/dev/md0`         | RAID device name   |
| `--level=0`        | RAID 0 (striping)  |
| `--raid-devices=2` | Number of disks    |

---

## Check RAID Status

```bash
cat /proc/mdstat
```

Example output:

```
md0 : active raid0 loop0 loop1
```

---

## Format RAID

```bash
sudo mkfs.ext4 /dev/md0
```

---

## Mount RAID

```bash
sudo mkdir /raid0
sudo mount /dev/md0 /raid0
```

Verify mount:

```bash
df -h
```

---

# 5. RAID 1 (Mirroring)

## Concept

RAID 1 stores an identical copy of data on multiple disks.

Example:

```
Disk1 → File A
Disk2 → File A (mirror copy)
```

If one disk fails, the system continues running using the other disk.

---

# 6. Creating RAID 1

First stop the previous RAID array.

```bash
sudo mdadm --stop /dev/md0
```

Create RAID 1:

```bash
sudo mdadm --create --verbose /dev/md1 --level=1 --raid-devices=2 /dev/loop0 /dev/loop1
```

---

## Check RAID Status

```bash
cat /proc/mdstat
```

Example:

```
md1 : active raid1 loop0 loop1
```

---

## Format RAID

```bash
sudo mkfs.ext4 /dev/md1
```

---

## Mount RAID

```bash
sudo mkdir /raid1
sudo mount /dev/md1 /raid1
```

---

## Test Mirroring

Create a file inside the RAID filesystem:

```bash
echo "RAID TEST" | sudo tee /raid1/test.txt
```

The file is automatically mirrored across both disks.

---

# 7. Simulating Disk Failure

This simulates a real-world server disk failure.

---

## Check RAID Status

```bash
cat /proc/mdstat
```

---

## Mark a Disk as Failed

```bash
sudo mdadm --fail /dev/md1 /dev/loop1
```

Example output:

```
loop1 (F)
```

`(F)` indicates a failed disk.

The RAID array is now **degraded** but still functional.

---

## Remove the Failed Disk

```bash
sudo mdadm --remove /dev/md1 /dev/loop1
```

---

## Add Replacement Disk

```bash
sudo mdadm --add /dev/md1 /dev/loop1
```

---

## Monitor RAID Rebuild

```bash
cat /proc/mdstat
```

Example rebuild status:

```
recovery = 45%
```

This indicates the mirror is rebuilding.

---

# 8. Real World Importance

RAID is critical for production systems such as:

* Banking servers
* Hospital databases
* Cloud storage systems
* Enterprise applications

RAID 1 ensures systems remain operational even when a disk fails.

---

# Summary

This lab covered:

* RAID fundamentals
* RAID 0 (Striping)
* RAID 1 (Mirroring)
* Creating RAID arrays with `mdadm`
* Formatting and mounting RAID
* Simulating disk failure
* Rebuilding RAID arrays

These skills are essential for:

* Linux system administration
* DevOps
* Infrastructure engineering
* Security and forensic analysis
