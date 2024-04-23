#!/bin/bash

# This script retrieves the list of files in an S3 bucket and saves it to a file.

# Function: getlist()
#
# This function retrieves the list of files in the S3 bucket and saves it to a file.
# It retries the operation up to a maximum number of times if it fails.
#
# Returns:
#   0 if the operation is successful
#   1 if the operation fails after the maximum number of retries
getlist() {
    output_file="list.txt"
    mkdir -p output && touch output/list.txt
    counter=1
    max_retries=10

    # Retry the operation until it is successful or the maximum number of retries is reached
    until [ $counter -gt $max_retries ]; do
        if aws s3 ls s3://clouduploadertds > output/list.txt; then
            break
        fi
        ((counter++))
    done

    # Check if the operation failed after the maximum number of retries
    if [ $counter -gt $max_retries ]; then
        echo "Error: Failed to list S3 bucket after $max_retries retries"
        exit 1
    fi
}

# Call the getlist() function
getlist

# Print a success message
echo "Request successful"