#!/bin/bash

while getopts "u:d:" opt; do
        case $opt in
            u)
            repo_URL=$OPTARG
            ;;
            d)
            days=$OPTARG
            ;;
        esac
    done    
        #generate commit report in csv format
            git clone $repo_URL
            repo_dir=$(basename "$repo_URL" .git)
            cd $repo_dir
            echo "Date,Author Name,Author Email,Commit Message,Commit Hash" > ./commit_report.csv
            git log --pretty=format:"%ad,%an,%ae,%s,%H" --since="$days days ago" >> ./commit_report.csv
            sed -i s/,/"|"/g ./commit_report.csv 
            cat commit_report.csv