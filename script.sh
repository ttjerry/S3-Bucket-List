#!/bin/bash
  
 getlist() {
    output_file="list.txt"
    cd output
    touch $output_file
    aws s3 ls s3://clouduploadertds > $output_file 
}

counter=1

until [ $counter -gt 15 ]; 
do
    printf "-"
    ((counter++))
done

getlist

