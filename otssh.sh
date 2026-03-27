#!/bin/bash

# create a alias in .bashrc file "alisa otssh=bash /home/ubuntu/otssh.sh"

set -x

#call function file

. /home/ubuntu/asignment_ssh/function.sh
while getopts "Un:an:h:u:r:p:i:ldm" opt; do
	case $opt in
		a) add_ssh=true;;
		n) name=$OPTARG;;
		h) host=$OPTARG;;
		u) user=$OPTARG;;
		p) port=$OPTARG;;
		i) key=$OPTARG;;
		r) del_ssh=true; server=$OPTARG;;
		l) list_ssh=true;;
		d) list_details_ssh=true;;
		U) update_ssh=true;;
		*) invalid ;;
	esac
done

if [ "$add_ssh" = true ]; then
	if [ -z "$name" ] || [ -z "$host" ] || [ -z "$user" ]; then
		echo "-a -n -h and -u are required" 
		exit 1
	fi

	if [ -z "$port" ]; then
		port=""
	else
		port="-p $port"
	fi
	if [ -z "$key" ]; then
		key=""
	else 
		key="-i $key"
	fi

		add_ssh
fi

if [[ "$list_ssh" = true ]] || [[ "$list_details_ssh" = true ]]; then
		list_ssh "$list_details_ssh"
fi

if [ "$update_ssh" = true ]; then
        if [ -z "$name" ] || [ -z "$host" ] || [ -z "$user" ]; then
                echo "-a -n -h and -u are required" 
                exit 1
        fi

        if [ -z "$port" ]; then
                port=""
        else
                port="-p $port"
        fi
        if [ -z "$key" ]; then
                key=""
        else
                key="-i $key"
        fi

                update_ssh
fi


if [ "$del_ssh" = true ]; then
	del_ssh
fi

if [ -z $add_ssh ] && [ -z "$list_ssh" ] && [ -z "$list_details_ssh" ] && [ -z "$update_ssh" ] && [ -z "$del_ssh" ] ; then
connect_ssh "$1"
fi

