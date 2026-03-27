## Assignment 6 - Process Management Tools ##
In this assignment, we will build three process management utilities using shell scripting. 
These tools will help us monitor, control, and manage system processes and services in a Linux environment.

### Part A: Process Management Utility (otProcessManager) ###
This script helps us check running processes, kill, or monitor them based on different conditions.

Show Top N Processes Using Memory

(Shows top 5 processes using the most memory)

``` ./otProcessManager topProcess 5 memory ```



Show Top N Processes Using CPU

(Shows top 10 processes using the most CPU)

``` ./otProcessManager topProcess 10 cpu ```



Kill the Process with the Lowest Priority

``` ./otProcessManager killLeastPriorityProcess ```


Show How Long a Process Has Been Running

``` ./otProcessManager RunningDurationProcess <processName or processID> ```


List Orphan Processes

(These are processes whose parent has ended)

``` ./otProcessManager listOrphanProcess ```


List Zombie Processes

(These are dead processes still in the process table)

```./otProcessManager listZoombieProcess```


Kill a Process by Name or PID

```./otProcessManager killProcess <processName or processID>```


List Processes Waiting for Resources

```./otProcessManager ListWaitingProcess```



### Part B: Process Manager Utility (ProcessManager.sh) ###

This tool helps us manage custom services or scripts by starting, stopping, checking their status, and changing their priority.

What we can do with it:

Start a Service

```./ProcessManager.sh -o start -a <alias>```


Check Service Status

```./ProcessManager.sh -o status -a <alias>```


Stop a Service

```./ProcessManager.sh -o kill -a <alias>```


Change Priority of a Service

```./ProcessManager.sh -o priority -p <low/med/high> -a <alias>```


List All Services We Started

```./ProcessManager.sh -o list```


Show Details of All Running Services

```./ProcessManager.sh -o top```



### Part C: Playing with Processes ###

Here we explore how processes react to certain changes.

Things we will try:

Clear the log file of a running process

Delete the log file of a running process and observe what happens

Increase (elevate) the priority of a running process
