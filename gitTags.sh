#!/bin/bash

set -x

while getopts "t:d:l" act; do
        case $act in
            t) 
            operation=create_tag
            ;;
            d)
            operation=delete_tag
            ;;
            l)
            operation=list_tag
            ;;
            *)
            echo "invalid option"
        esac
    done

    case $operation in
            #create a tag on latest commit id
            create_tag)
            shift
            tag_name=$1
            git tag $tag_name 
            ;;

            #delete tag
            delete_tag)
            shift
            tag_name=$1
            git tag --delete $tag_name 
            ;;

            #list tag
            list_tag)
            git tag 
            ;;
esac
