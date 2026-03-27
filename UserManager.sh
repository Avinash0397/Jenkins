#!/bin/bash

set -x

action=$1

case $action in

	# Add a new group (team)
	addTeam)	
		gname=$2
		sudo groupadd $gname
		echo $gname >> ./group.txt
		;;

	# Add a new user and assign to groups
	addUser)
		name=$2
		gname=$3
		read -p "please enter your batch no. " batchgrp
		if ! grep -w $batchgrp /etc/group ; then
			echo "ERROR: $batchgrp group not exist"     
		else
			sudo useradd -m $name -G $gname,$batchgrp  
			sudo chmod 751 /home/$name
			sudo mkdir /home/$name/{team,ninja}
			sudo chown -R $name:$gname /home/$name/team
			sudo chown -R $name:$batchgrp /home/$name/ninja
			sudo chmod 770 /home/$name/team
			sudo chmod 777 /home/$name/ninja
			sudo echo $name >> ./user.txt
			sudo echo $gname >> ./group.txt
			info=$(id $name)
			echo "INFO: user $name created and user information $info"
		fi
		;;

	# Change the user's shell
	changeShell)
		shell=$2
		name=$3
		sudo usermod -s $shell $name
		echo "INFO: $shell shell changed for $name user"
		;;

	# Change the user's password
	changePasswd)
		name=$2
		sudo passwd $name
		echo "INFO: password successfully changed for $name user"
		;;

	# Delete a user
	delUser)
		name=$2
		sudo userdel -r $name
		echo "INFO: user $name removed"
		;;

	# Delete a group
	delTeam)
		gname=$2
		sudo groupdel $gname
		echo "INFO: group $gname removed"
		;;

	# List users or groups
	ls)
		if [ "$name" == "User" ]; then
			cat ./user.txt
		elif [ $name == Team ]; then
			cat ./group.txt
		else
			echo "invalid option"
		fi
		;;

	*) 
		echo "please enter the correct action"
		;;
esac
