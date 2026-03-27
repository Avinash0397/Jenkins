#!/bin/bash

ssh_user=/home/ubuntu/asignment_ssh/ssh_user.txt

#Add ssh connection
add_ssh (){
	if grep -qi "$name:" "$ssh_user" ; then
		echo "$name ssh connection already added"
	else
	echo "$name: ssh $key $port $user@$host" >> ssh_user.txt
	fi
}
#List ssh connection
list_ssh (){
	if [ -s $ssh_user ]; then
		if [ $1 = true ]; then
			cat $ssh_user
		else
			awk '{print $1}' $ssh_user
		fi
	fi
}

#update ssh connection
update_ssh (){
	if grep -q "$name:" "$ssh_user"; then
		sed -i "/"$name:"/s|ssh .*@.*|ssh $key $port $user@$host|" ssh_user.txt
	fi
}

#delete ssh connection
del_ssh (){
	if grep -q "$server:" "$ssh_user"; then
	sed -i /"$server":/d $ssh_user
	else
		echo "not found"
	fi
}

#connect to ssh server
connect_ssh (){
		local server=$1
		if grep -q "^$server:" ssh_user.txt; then
	ssh_ip_info=$(grep "^$server:" ssh_user.txt | awk '{$1=""}; {print $0}')
	$ssh_ip_info
	else
	echo "[ERROR]: Server information is not available, please add server first"
		fi
}
