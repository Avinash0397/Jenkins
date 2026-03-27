#!/bin/bash

# call the function file
. function.sh

case $1 in 
	log_processes)
		log ;;
	delete_log_file)
		log_delete ;;
	elevate_priority)
        priority ;;
esac

