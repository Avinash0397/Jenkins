#Define the path of log file
LOG_FILE="/tmp/process_log.txt"

#log running processes
log() {
    ps aux > "$LOG_FILE"
    echo "Current running processes logged to $LOG_FILE."
}

# delete the log file
log_delete() {
    if [[ -f "$LOG_FILE" ]]; then
        read -p "Are you sure you want to delete the log file $LOG_FILE? (y/n): " answer
        if [[ "$answer" == "y" ]]; then
            rm "$LOG_FILE"
            echo "Log file $LOG_FILE deleted."
        else
            echo "Log file deletion canceled."
        fi
    else
        echo "Log file $LOG_FILE does not exist."
    fi
}

if [[ -f "$LOG_FILE" ]]; then
    echo "Log file still exists."
else
    echo "Log file has been successfully deleted.!"
fi

#elevate the priority of a process
priority() {
    read -p "Enter the PID of the process to elevate its priority: " pid
    read -p "Enter the new priority value (-20 to 19): " priority

    if ps -p "$pid" > /dev/null; then
        echo "Changing priority of process $pid to $priority."
        renice "$priority" -p "$pid"
        echo "Priority of process $pid changed to $priority."
    else
        echo "Process $pid is not running."
    fi
}
