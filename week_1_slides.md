---

author: Shreya Gurram 
theme: ./dracula.json

---

## Stuff to do today

1. Discuss FOSS
1. History of Linux
1. Kernel
1. Shells
1. Computer Architectures

---

## Open Source and FOSS

- MS-DOS Source Code: https://github.com/microsoft/MS-DOS
- GNU Project: https://www.gnu.org/
- `git`: https://git-scm.com/

---

## Linux or rather GNU/Linux

#### Linux -> Linux Kernel

#### GNU Project -> crucial software compents for a fully functional OS

- GNU C Compiler
- GNU Bash(Bourne Again Shell)
- GNU Coreutils

---

## Kernel

- Brain for the brain of the system
- manages what happens on the CPU, RAM and other hardware components

#### Functions:

1. Process Management
1. Memory Management
1. Device Management
1. Security and Access Control

## Shells

- interface to talk to the kernel
- converts shell code or rather commands to execute on the hardware via the kernel

---

```bash
toilet "hi class"
```

## Today's Agenda

### 1. What did we do last class?

### 2. Some command line operations

### 3. Handling File Permissions

### 4. Start off with Boot Seqences

### 5. if(time){ segmentation }

---

# Command line operations

## 1. Change Directories:

```bash
cd ~/Documents/Stuff/PES/
```

---

```bash
cd ~/Documents/Stuff/Projects-Repos/os_fundamentals_linux_course_materials/
```

```bash
cd .
```

---

```bash
cd ..
```

---

## 2. List Directories and Files:

```bash
ls
```

---

```bash
ls -a
```

or

```bash
ls -all
```

---

```bash
ls -A
```

or

```bash
ls --almost-all
```

- ls -A or ls -almost-all
- ls -i or ls -inode

## once sec what is `inode`?

data structure containing key information about the file

---

## 3. Present Working Directory:

```bash
pwd
```

---

## Create Files:

```bash
touch filename.txt
ls
```

---

## Make Directory:

```bash
mkdir dirName
ls
```

---

## Delete File:

```bash
rm filename.txt
ls
```

---

## Delete Directory:

```bash
rm -rf dirName
ls
```

---

# Some key aspects of Linux Adminstration!

1. Understanding Ownership
1. Handling file permissions
1. creating users
1. modifying permissions

---

# Ownership

1. Owner:

- has `rwx`
- can decide `rwx` for users

2. Group:

- group of users, with some permissions granted by the owner.
- usually don't have special permissions like `delete`

3. Other:

- most cases the owner would give read permissions

---

- The first part (-rw-r--r--) represents permissions.
- The first character (- in this case) indicates if it’s a file (-) or directory (d).
- The next 9 characters represent the permissions:
- r (read), w (write), and x (execute).
- The first 3 characters are the permissions for the owner, the next 3 for the group, and the last 3 for others.

```bash
ls -l week_1_slides.md
```

---

`chmod u+rwx,g-w,o=r filename`

r, w, x with + (add), - (remove), or = (set) to adjust permissions

---

# Assign numbers!

- r = 4
- w = 2
- x = 1

First digit for owner or user
Second digit for group
Third digit for others

Example: 755
`chmod 755 filename`

---

# Binary is cool

---

# BIOS: Basic Input Output System

- initialises and tests hardware -> runtime env for OS
- support for drives upto 2 TB
- POST (Power On Self Test)
- 16 bit mode
- MBR only

---

# UEFI: Unified Extensible Firmware Interface

- faster boot times -> PARALLELISES!
- support for larger drives (> 2 TB)
- secure boot
- 32 bit mode / 64 bit mode
- MBR and GUID-PT

---

# Boot Sequence

```graph-easy --as=boxart
[ Power On ] 
  - to -> 
[ BIOS/UEFI Initialization ] 
  - to -> 
[ Power-On Self-Test (POST) ] 
  - to -> 
[ Boot Device Selection ] 
  - to -> 
[ Load Bootloader ] 
  - to -> 
[ Load Kernel and initramfs ] 
  - to -> 
[ Initialize System ]
```

---

# initramfs: init-ram-fs

- temp root fs loaded into the memory
- contains essential drivers to initialise the system before actual fs is mounted
- mounts the actual root file system

## Contains:

- Kernel Modules
- Scripts: Init!!
- config files to mount the root fs

---

```graph-easy --as=boxart
[ Bootloader (e.g., GRUB) ] 
  - to -> 
[ Load Kernel Image and initramfs ] 
  - to -> 
[ Kernel Decompresses and Mounts initramfs as Initial Root FS ] 
  - to -> 
[ Start Executing init Process (/init) ] 
  - to -> 
[ Detect Real Root FS Type (ext4, xfs) ] 
  - to -> 
[ Load Necessary Kernel Modules ] 
  - to -> 
[ Mount Real Root File System ] 
  - to -> 
[ Switch from initramfs to Actual Root FS ] 
  - to -> 
[ Continue Booting from Actual Root FS ]
```

---

```bash
#!/bin/bash

echo "hallo world"
```

---

```bash
#!/bin/sh
# This is a comment!
echo "Hello      World"       # This is a comment, too!
echo "Hello World"
```

---

```bash
echo "Hello * World"
echo Hello * World
```

---

```bash
echo Hello      World
echo "Hello" World
```

---

```bash
echo Hello "     " World
echo "Hello "*" World"
echo `hello` world
echo 'hello' world
```

---

# Cron Jobs
Automate jobs based on time requirements

But how?


---


Cron -> daemon process -> a process that run in the background with out any interactivity
config file at `/etc/crontab`

---


