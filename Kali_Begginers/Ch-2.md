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
## See SSH sessions/processes
```
ps aux | grep ssh
```
Each command teaches you how Linux provides real-time visibility into system resources.

