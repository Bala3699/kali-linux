# `>_`Ch-2 linux comments

##  `.sh` Shell scripts
Files with the **`.sh`** extension contain CLI commands and are called shell scripts. Such scripts are used both by IT teams to automate things and by attackers to quickly run malicious commands.
```
setup.sh
```
## To list unique items from text
>`'|'` Pipe symbol Send the output from the first command to the second 
```
cat tst.txt | sort | uniq
```
## Output redirect `'(>/>>)'`	Use `'>'` to overwrite a file, and `'>>'` to append to the end
```
cat tst.txt | sort | uniq > /home/dark.txt
```
## To Delete the file
```
rm tst.txt
```
## Replace the original file with another file
> `'&&'` Double ampersand This run's the second command if the first was successful
```
mv ct.txt man.txt && echo "File Moved"
```
## To see how much time your system is running
```
uptime
```      
## To check your ip address
```
ifconfig
```
## To Process all the files
```
psaux
```
## To verify the current User
```
whoami
```
## To swetch to Root user
```
sudo su
```
# To return back to normal user
```
exit
```
## To analyse the Bash History
```
history
```
## Check disk usage in human-readable format 
```
df -h
```
## View running processes live 
```
top
```
What happens:
-  Shows running programs
-  Shows CPU usage
-  Shows memory usage
Think of it as:
>  Linux Task Manager
Columns:
-  PID → process ID
-  USER → who runs it
-  %CPU → CPU usage
-  %MEM → RAM usage
```
q
```
q Exit by pressing  
Why important:
-  Find slow programs
-  Monitor system health
-  Kill misbehaving processes (later)

## See SSH sessions/processes
```
ps aux | grep ssh
```
Each command teaches you how Linux provides real-time visibility into system resources.

## to see see the kernel running on your system.
```
uname -a
```
- uname - print the system information
- -a show available details

Meaning:
- Linux → kernel name
- 5.15.0-70 → kernel version
- x86_64 → 64-bit system
- GNU/Linux → GNU tools + Linux kernel
  
This proves Linux is the kernel, not the whole OS.

## to print working directory
```
pwd
```
## Long listing format
```
ls -l
```
Example output:
```
drwxr-xr-x 2 student student 4096 Documents
```

Breakdown:

-  d → directory
-  rwx → owner permissions
-  r-x → group permissions
-  r-x → others
-  student → owner
-  4096 → size

## Go back
```
cd ..
```
- `..` means one level up

## Command Structure (VERY IMPORTANT)
Every Linux command follows this pattern:
```
command  option(s)  argument(s)
```
Example:
```
ls -l /home
```

- `ls` → command
- `-l` → option (how to run)
- `/home` → argument (on what)

---

## Conclusion

Comments are essential for writing **clean, readable, and maintainable shell scripts**. Proper commenting is a key skill for:

* Linux system administrators
* DevOps engineers
* Cybersecurity professionals

---

⭐ *If you found this helpful, give the repository a star!*

