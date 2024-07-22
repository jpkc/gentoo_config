#!/bin/bash
# bash samples

1ST_PARAMETER="${1?First parameter required}"
2ND_PARAMETER="${1?Second parameter required}"
3RD_PARAMETER="${1?Third parameter required}"

#setting variables
ORIGINALS_PATH="../originals"
CHAPTER_PATH="../chapters/17. Practical Residual Networks in PyTorch"

#locate and move files with find
find . -name "*.opus" | while read i; do mv "$i" "${i%.opus}.mp3"; done

#sample for iterating through files with space on name
a=0
for file in *.jpg
do
  new=$(printf "${OUTPUT_FILE_PREFIX}%04d.jpg" "$a")
  mv "${file}" "${new}"
  let a=a+1
done

#sample while
 while read i
 do
 	mv "$i" "${i%.opus}.mp3"
 done


#function definition
ffmpeg_nvidia_encode () { # file, start time, end time, output file name
	ffmpeg -vsync 0 -hwaccel_output_format cuda -c:v h264_cuvid -resize 1280x720 -i "$ORIGINALS_PATH/${1}" -ss "${2}" -to "${3}" -c:a aac -c:v h264_nvenc -b:v 750k "$CHAPTER_PATH/${4}.mp4"
}

# for examples:
NUMBER_OF_CHAPTERS="${1?Number of chapters required}"
for i in 1 .. NUMBER_OF_CHAPTERS
do
   echo "Welcome $i times"
done

for (( i=1; i<=NUMBER_OF_CHAPTERS; i++ ))
do 
   echo "Welcome ${i} times"
done



2
3
4
5
	
#!/bin/bash
for i in 1 2 3 4 5
do
   echo "Welcome $i times"
done

Sometimes you may need to set a step value (allowing one to count by two’s or to count backwards for instance). Latest bash version 3.0+ has inbuilt support for setting up ranges:
1
2
3
4
5
	
#!/bin/bash
for i in {1..5}
do
   echo "Welcome $i times"
done

Bash v4.0+ has inbuilt support for setting up a step value using {START..END..INCREMENT} syntax:
1
2
3
4
5
6
	
#!/bin/bash
echo "Bash version ${BASH_VERSION}..."
for i in {0..10..2}
do
  echo "Welcome $i times"
done

Sample outputs:

Bash version 4.0.33(0)-release...
Welcome 0 times
Welcome 2 times
Welcome 4 times
Welcome 6 times
Welcome 8 times
Welcome 10 times

The seq command to create standard bash for Loop (outdated method) ↑

WARNING! The seq command print a sequence of numbers and it is here due to historical reasons. The following examples is only recommend for older bash version. All users (bash v3.x+) are recommended to use the above syntax.

The seq command can be used as follows. A representative example in seq is as follows:
1
2
3
4
5
	
#!/bin/bash
for i in $(seq 1 2 20)
do
   echo "Welcome $i times"
done

There is no good reason to use an external command such as seq to count and increment numbers in the for loop, hence it is recommend that you avoid using seq. The builtin command are fast.
Three-expression bash for loops syntax ↑

This type of for loop share a common heritage with the C programming language. It is characterized by a three-parameter loop control expression; consisting of an initializer (EXP1), a loop-test or condition (EXP2), and a counting expression/step (EXP3).
1
2
3
4
5
6
7
8
9
10
11
	
for (( EXP1; EXP2; EXP3 ))
do
    command1
    command2
    command3
done
## The C-style Bash for loop ##
for (( initializer; condition; step ))
do
  shell_COMMANDS
done

A representative three-expression example in bash as follows:
1
2
3
4
5
6
7
	
#!/bin/bash
# set counter 'c' to 1 and condition 
# c is less than or equal to 5
for (( c=1; c<=5; c++ ))
do 
   echo "Welcome $c times"
done

Sample output:

Welcome 1 times
Welcome 2 times
Welcome 3 times
Welcome 4 times
Welcome 5 times

How do I use for as infinite loops? ↑

Infinite for loop can be created with empty expressions, such as:
1
2
3
4
5
	
#!/bin/bash
for (( ; ; ))
do
   echo "infinite loops [ hit CTRL+C to stop]"
done
Conditional exit with break ↑

You can do early exit with break statement inside the for loop. You can exit from within a FOR, WHILE or UNTIL loop using break. General break statement inside the for loop:
1
2
3
4
5
6
7
8
9
10
	
for I in 1 2 3 4 5
do
  statements1      #Executed for all values of ''I'', up to a disaster-condition if any.
  statements2
  if (disaster-condition)
  then
    break              #Abandon the loop.
  fi
  statements3              #While good and, no disaster-condition.
done

Following shell script will go though all files stored in /etc directory. The for loop will be abandon when /etc/resolv.conf file found.
1
2
3
4
5
6
7
8
9
10
	
#!/bin/bash
for file in /etc/*
do
    if [ "${file}" == "/etc/resolv.conf" ]
    then
        countNameservers=$(grep -c nameserver /etc/resolv.conf)
        echo "Total  ${countNameservers} nameservers defined in ${file}"
        break
    fi
done
Early continuation with continue statement ↑

To resume the next iteration of the enclosing FOR, WHILE or UNTIL loop use continue statement.
1
2
3
4
5
6
7
8
9
10
	
for I in 1 2 3 4 5
do
  statements1      #Executed for all values of ''I'', up to a disaster-condition if any.
  statements2
  if (condition)
  then
    continue   #Go to next iteration of I in the loop and skip statements3
  fi
  statements3
done

This script make backup of all file names specified on command line. If .bak file exists, it will skip the cp command.
1
2
3
4
5
6
7
8
9
10
11
12
13
	
#!/bin/bash
FILES="$@"
for f in $FILES
do
        # if .bak backup file exists, read next file
    if [ -f ${f}.bak ]
    then
        echo "Skiping $f file..."
        continue  # read next file and skip the cp command
    fi
        # we are here means no backup file exists, just use cp command to copy file
    /bin/cp $f $f.bak
done
For loop with array elements ↑

In this example, we use the for loop to iterate over an array of elements defined as follows:
1
2
3
4
5
6
7
8
9
10
11
12
13
14
	
# Set three aws zones to create RDS instances 
DB_AWS_ZONE=('us-east-2a' 'us-west-1a' 'eu-central-1a')
 
for zone in "${DB_AWS_ZONE[@]}"
do
  echo "Creating rds (DB) server in $zone, please wait ..."
  aws rds create-db-instance \
  --availability-zone "$zone" \
  --allocated-storage 20 --db-instance-class db.m1.small \
  --db-instance-identifier test-instance \
  --engine mariadb \
  --master-username my_user_name \
  --master-user-password my_password_here
done
Loop with a shell variable ↑

Sometimes we store important data in the shell variable, and we can use for a loop as follows to read the data:
1
2
3
4
5
	
_admin_ip="202.54.1.33|MUM_VPN_GATEWAY 23.1.2.3|DEL_VPN_GATEWAY 13.1.2.3|SG_VPN_GATEWAY"
for e in $_admin_ip
do
   ufw allow from "${e%%|*}" to any port 22 proto tcp comment 'Open SSH port for ${e##*|}'
done
Loop with a number ↑

We can specify a range in loops as follows:
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
	
for i in {START..END}
do
   commands
done
## step value ##
for i in {START..END..STEP}
do
   commands
done
## example: ping cbz01, cbz02, cbz03, and cbz04 using a loop ##
for i in 0{1..4}
do
    h="cbz${i}"
    ping -c 1 -q "$h" &>/dev/null
    if [ $? -eq 0 ]
    then
        echo "server $h alive"
    else
        echo "server $h dead or can not ping."
    fi
done
Loop with strings

Say we have a variable named PKGS, and we need to loop through a list of strings to install those packages:
1
2
3
4
5
6
	
PKGS="php7-openssl-7.3.19-r0  php7-common-7.3.19-r0  php7-fpm-7.3.19-r0  php7-opcache-7.3.19-r0 php7-7.3.19-r0"
for p in $PKGS
do
   echo "Installing $p package"
   sudo apk add "$p"
done
Command substitution ↑

Command substitution means run a shell command and store its output to a variable. For example:
1
2
	
up=$(uptime)
echo "Server uptime is $up"

The for Loop argument list also workes command substitution as follows:
1
2
3
4
5
6
7
8
9
	
for var in $(command)
do
  print "$var"
done
## example ##
for f in $(ls /nas/*.pdf)
do
  print "File $f"
done
Command-line arguments ↑

A command line argument is nothing but an argument sent to a program being called. A program can take any number of command line arguments. For example, we are going to use the grep command to search for user names in the /etc/passwd file:

grep 'vivek' /etc/passwd

grep is the name of an actual command and shell executed this command when you type command at shell prompt. The first word on the command line is:

    grep – name of the command to be executed.
    Everything else on command line is taken as arguments to this command.

The for Loop argument list also accepts Command-line arguments/parameters as follows:
1
2
3
4
5
	
## $@ expands to the positional parameters, starting from one.  ##
for i in $@
do
    echo "Script arg is $i"
done

You run it as follows:

./script one foo bar
Putting all together ↑

Bash for loop is useful for automating repetitive tasks in IT. Let us see how to run a simple command (such as uptime) on multiple Linux or Unix servers:
1
2
3
4
	
for s in server1 server2 server3
do
    ssh vivek@${s} "uptime"
done

OR combine the echo command along with command substitution as follows:
1
2
3
4
	
for s in server1 server2 server3
do
    echo "Server ${s}: $(ssh vivek@${s} uptime)"
done

Sample outputs:

Server server1:  09:34:46 up 12 days, 21:57,  0 users,  load average: 0.08, 0.09, 0.09
Server server2:  09:34:50 up 17 days,  2:30,  0 users,  load average: 0.03, 0.03, 0.00
Server server3:  09:34:53 up 17 days,  2:31,  0 users,  load average: 0.04, 0.04, 0.00

In this standard bash for loop example we are going to update all CentOS/RHEL based servers using the yum command or apt command/apt-get command in case we have a Debian/Ubuntu based servers:
1
2
3
4
5
6
	
## CENTOS/RHEL example (for fedora replace yum with dnf) ##
for s in server0{1..8}
do
    echo "*** Patching and updating ${s} ***"
    ssh root@${s} -- "yum -y update"
done

Here is simple but useful shell script example:
patch-debian-vm.sh
1
2
3
4
5
6
7
8
9
10
11
12
13
	
#!/usr/bin/env bash
# Purpose: Update all my Linode servers powered by Debian/Ubuntu Linux
# Author: Vivek Gite under GPL v2.x+
# ----------------------------------------
log="/tmp/apt-get.log"
>"${log}"
for s in ln.cbz0{1..5}
do
   echo "Updating and patching $s, please wait..." | tee -a "${log}"
   ssh root@${s} -- apt-get -q -y update >/dev/null
   ssh root@${s} -- DEBIAN_FRONTEND=noninteractive apt-get -y -q upgrade >>"${log}"
done
echo "Check $log file for details."

See why we used DEBIAN_FRONTEND apt-get variable to avoid any prompts during updates. It would be best if you set up ssh keys for automation purposes or running scripts from Linux/Unix cron jobs.
Finding ping time for multiple IP addresses

Here is my sample code:
find-ping-time.sh
1
2
3
	
#!/bin/bash
ips="$(host -t a www.cyberciti.biz | awk '{ print $4}')"
for i in $ips; do ping -q -c 4 "$i"; done

for (( i=1; i<=NUMBER_OF_CHAPTERS; i++ ))
do 
  let START=(i-1)*10000
  let END=i*10000-1
echo "
[CHAPTER]
TIMEBASE=1/1000
START=${START}
END=${END}
title=chapter ${i}" >> chapter-metadata.txt
done

# if examples testing for files
FILE=/etc/resolv.conf
if test -f "$FILE"; then
    echo "$FILE exists."
fi

FILE=/etc/resolv.conf
if [ -f "$FILE" ]; then
    echo "$FILE exists."
fi

FILE=/etc/resolv.conf
if [[ -f "$FILE" ]]; then
    echo "$FILE exists."
fi

# If you want to perform a different action based on whether the file exists or not, use the if/then construct:

FILE=/etc/resolv.conf
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else 
    echo "$FILE does not exist."
fi

FILE=/etc/docker
if [ -d "$FILE" ]; then
    echo "$FILE is a directory."
fi


FILE=/etc/docker
if [ ! -f "$FILE" ]; then
    echo "$FILE does not exist."
fi

# checking stuff without using if

test -f /etc/resolv.conf && echo "$FILE exists."

[ -f /etc/resolv.conf ] && echo "$FILE exists."

[[ -f /etc/resolv.conf ]] && echo "$FILE exists."

[ ! -f /etc/docker ] && echo "$FILE does not exist."


[ -d /etc/docker ] && echo "$FILE is a directory."

# If you want to run a series of commands after the && operator, enclose the commands in curly brackets separated by ; or &&:

[ -f /etc/resolv.conf ] && { echo "$FILE exist."; cp "$FILE" /tmp/; }

# In contrast to &&, the statement after the || operator will only be executed if the exit status of the test command is false.

[ -f /etc/resolv.conf ] && echo "$FILE exist." || echo "$FILE does not exist."


# Check if Multiple Files Exist
# Instead of using complicated nested if/else constructs, you can use -a (or && with [[) to test if multiple files exist:

if [ -f /etc/resolv.conf -a -f /etc/hosts ]; then
    echo "Both files exist."
fi

if [[ -f /etc/resolv.conf && -f /etc/hosts ]]; then
    echo "Both files exist."
fi

# Equivalent variants without using the IF statement:

[ -f /etc/resolv.conf -a -f /etc/hosts ] && echo "Both files exist."

[[ -f /etc/resolv.conf && -f /etc/hosts ]] && echo "Both files exist."

File test operators

# The test command includes the following FILE operators that allow you to test for particular types of files:

#     -b FILE - True if the FILE exists and is a special block file.
#     -c FILE - True if the FILE exists and is a special character file.
#    -d FILE - True if the FILE exists and is a directory.
#    -e FILE - True if the FILE exists and is a file, regardless of type (node, directory, socket, etc.).
#    -f FILE - True if the FILE exists and is a regular file (not a directory or device).
#    -G FILE - True if the FILE exists and has the same group as the user running the command.
#    -h FILE - True if the FILE exists and is a symbolic link.
#    -g FILE - True if the FILE exists and has set-group-id (sgid) flag set.
#    -k FILE - True if the FILE exists and has a sticky bit flag set.
#    -L FILE - True if the FILE exists and is a symbolic link.
#    -O FILE - True if the FILE exists and is owned by the user running the command.
#    -p FILE - True if the FILE exists and is a pipe.
#    -r FILE - True if the FILE exists and is readable.
#    -S FILE - True if the FILE exists and is a socket.
#    -s FILE - True if the FILE exists and has nonzero size.
#    -u FILE - True if the FILE exists and set-user-id (suid) flag is set.
#    -w FILE - True if the FILE exists and is writable.
#    -x FILE - True if the FILE exists and is executable.




