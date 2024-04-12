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

if [ $? -eq 0 ]; then
    getlist
    
    echo "Request successful"
else
    echo "Request failed, check network and try again"
fi


