
# Day 2 – Tcl Fundamentals (The Brain Behind Expect)

Expect scripts are built on top of the **Tcl programming language**.

Tcl stands for:

```
Tool Command Language
```

It was created by John Ousterhout.

Expect extends Tcl with automation capabilities, allowing scripts to interact with command-line programs.

```
Expect = Tcl + Automation
```

Understanding basic Tcl concepts makes writing Expect scripts much easier.

---

# Tcl's Golden Rule

The most important concept in Tcl is:

```
Everything is a string
```

All data types in Tcl are treated as text.

Examples:

Numbers

```
"10"
```

Lists

```
"1 2 3"
```

Commands

```
"ls"
```

Everything in Tcl is stored and processed as **text strings**.

---

# Example

```tcl
set age 25
```

Meaning:

```
Store the string "25" inside the variable age
```

Even numeric values are handled as strings internally.

---

# Variables in Tcl

Variables are created using the `set` command.

Example:

```tcl
set name "bala"
```

To print the value of the variable:

```tcl
puts $name
```

Output:

```
bala
```

---

# The `$` Symbol

The `$` symbol is used to **retrieve the value of a variable**.

Example:

```tcl
set city "Chennai"
puts $city
```

Output:

```
Chennai
```

Here `$city` accesses the value stored inside the variable.

---

# Running Linux Commands in Tcl

Tcl scripts can execute Linux commands using the `exec` command.

Example:

```tcl
exec ls
```

Another example:

```tcl
exec whoami
```

The output of these commands is returned to the Tcl script.

---

# Quoting Rules in Tcl

Tcl supports three main quoting styles.

---

## Double Quotes

Variables inside double quotes are expanded.

Example:

```tcl
puts "Hello $name"
```

Output:

```
Hello bala
```

---

## Curly Braces

Variables inside curly braces are **not expanded**.

Example:

```tcl
puts {Hello $name}
```

Output:

```
Hello $name
```

---

## No Quotes

Quotes are optional when printing a single word.

Example:

```tcl
puts Hello
```

Output:

```
Hello
```

---

# Understanding Tcl Compared to Other Languages

Programming languages approach scripting differently.

```
Python → structured and strongly typed scripting
C → low-level system programming
Tcl → flexible command and text processing
```

Tcl focuses on **processing text and executing commands easily**, which makes it extremely useful for **automation tasks**.

---

# Summary

Key Tcl concepts used in Expect scripting:

* Tcl stands for **Tool Command Language**
* Everything in Tcl is treated as **a string**
* Variables are created using `set`
* Variable values are accessed using `$`
* Linux commands can be executed using `exec`
* Quoting rules affect how variables are interpreted

These fundamentals form the foundation for writing **powerful Expect automation scripts**.
