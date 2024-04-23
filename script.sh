#!/bin/bash

getlist() {
    output_file="list.txt"
    mkdir -p output && touch output/list.txt
    counter=1
    max_retries=10
    until [ $counter -gt $max_retries ]; do
        if aws s3 ls s3://clouduploadertds > output/list.txt; then
            break
        fi
        ((counter++))
    done

    if [ $counter -gt $max_retries ]; then
        echo "Error: Failed to list S3 bucket after $max_retries retries"
        exit 1
    fi
}

getlist
echo "Request successful"