#!/bin/bash

action=$1

path=$2

name=$3

content=$4

case $action in 
	addDir)  
		if [ ! -d $path/$name ]; then
		mkdir  $path/$name
		echo "Directory created $path/$name"
		else
		echo "Directory already exist $path/$name"
		fi
		;;
	listFiles) 
		find $path -type f
		;;
	listDir) 
		ls -d $path
		;;
	listAll) 
		ls -a $path
		;;
	deleteDir)  
		if [ -d $path/$name ]; then
		rm -d $path/$name
		echo "Directory removed $path/$name"
		else	
		echo "Directory does not exist"
		fi
		;;
	addFile) 
		if [ ! -f $path/$name ]; then
		touch $path/$name
		echo "file created $path/$name"
		else
			read -p "File exists. Enter content to overwrite: " msg
			echo "$msg" > $path/$name
		fi
		;;
        addContentToFile) 
		if [ -f $path/$name ]; then 
                echo "$content" >> $path/$name
		echo "Content added to file: $name"
		else
			echo "File does not exist: $name"
		fi
		;;
	addContentToFileBegining) 
		read -p "Enter message to add at beginning: " msg
		read -p "Enter temporary file name: " newfile
		echo "$msg" > $path/$newfile && cat $path/$name >> $path/$newfile
		rm $path/$name && mv $path/$newfile $path/$name
		echo "Content added at the beginning of file: $name"
		;;
	showFileBeginingContent)  
		read -p "please enter the number" num
		if [ -f $path/$name ]; then
		head -n $num $path/$name
		else
		       echo "$name file is not exists"	
		fi
		;;
	showFileEndContent) 
                read -p "please enter the number" num
                if [ -f $path/$name ]; then
                tail -n $num $path/$name
                else
                       echo "$name file is not exist"  
                fi
                ;;
	showFileContentAtLine) 
                read -p "please enter the number" num
                if [ -f $path/$name ]; then
                head -n $num $path/$name | tail -n 1
                else
                       echo "$name file is not exist"  
                fi
                ;;		
	showFileContentForLineRange) 
                if [ -f $path/$name ]; then
                head -n $content1 $path/$name | tail -n $content
                else
                       echo "$name file is not exist"
                fi
                ;;
	moveFile) 
		if [ -f $path/$name ]; then
		mv $path $name
		echo "file move to $name"
		else 
			echo "$name file is not exists"
		fi
		;;
	copyFile) # this action use to copy file and dir
		if [ -f $path/$name ]; then
                cp $path $name
		echo "file copy to $name"
                else
                        echo "$name file is not exists"
                fi
                ;;
	clearFileContent) 
		 if [ -f $path/$name ]; then
			 printf "" > $path
			 echo "clear the content this $name"
                else
                        echo "$name file is not exists"
                fi
                ;;
	deleteFile) 
	       	if [ -f $path/$name ]; then
                rm -rf $path $name
		echo "file is delete $name"
                else
                        echo "$name file is not exists"
                fi      
                ;;
	*)
		echo "plese enter the correct action"
		;;

esac
 