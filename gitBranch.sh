#!/bin/bash

set -x

while getopts "lb:d:mr1:2:" act; do
        case $act in
            l) 
            operation=list;;
          
            b)
            operation=create
            branch_name=$OPTARG
            ;;
            d)
            operation=delete
            branch_name=$OPTARG
            ;;
            m)
            operation=merge
            ;;
            r)
            operation=rebase
            ;;
            1)
            branch_name1=$OPTARG
            ;;
            2) 
            branch_name2=$OPTARG
            *)
            echo "invalid option"
        esac
    done
    case $operation in
            #Create branch
            create)
            git branch $branch_name
            ;;

            #Delete branch
            delete)
            git branch -D $branch_name
            ;;

            #list Branch
            list)
            git branch
            ;;

            #merge branch one branch into another branch
            merge)
            git chechout $branch_name2
            git merge $branch_name1
            ;;

            #rebase branch one branch into another branch
            rebase)
            git checkout $branch_name1
            git rebase $branch_name2
            ;;
esac
