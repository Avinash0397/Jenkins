#!/bin/bash

while getopts "o:s:a:p:" flag;
do
        case $flag in
                o) action=${OPTARG};;
                s) path=${OPTARG};;
                a) alias=${OPTARG};;
                p) plevel=${OPTARG};;
                *)
                   echo "invalid argument"
                   exit 1
                   ;;
        esac
done

create_service() {                                             
             name=`echo $path | awk -F '.' '{print $1}'| awk -F '/' '{print $NF}'`
             echo -e "[Service]\nExecStart=$path" > /lib/systemd/system/$name.service
             ln -s /lib/systemd/system/$name.service    /etc/systemd/system/$alias.service
             systemctl start $alias.service
             echo $name.service >> created_services
}

case $action in

    register)       
        create_service
        echo "service created"
        ;;

    start)     
        systemctl start $alias.service
        ;;

    status)
        systemctl status $alias.service
        ;;

    kill)
        systemctl stop $alias.service
        ;;

    priority)                             
        pid=(systemctl status $alias | grep "Main PID" | awk '{print $3}')
        if [ $plevel = 'high' ]; then
        renice -20 -p $pid
        elif [ $plevel = 'mid' ]; then
        renice 0 -p $pid
        elif [ $plevel = 'low' ]; then
        renice +19 -p $pid
        else
        echo "wrong argument"
        fi
        ps -eo pid,comm,nice | grep $pid
        ;;

    list)
        cat created_services;;

    top)            

        pid=(systemctl status $alias | grep "Main PID" | awk '{print $3}')
        ps -eo pid,stat,pri,comm | grep $pid | awk -v a="$alias" '{printf "%-10s %-10s  %-10s %-10s %-10s\n", a, $1, $2, $3, $4}'
    ;;

    *)
        echo "Invalid action: Use action register, start, status, kill, priority, list, top"
    ;;