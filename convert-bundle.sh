#!/bin/bash
# Download the data
curl -O https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz

tar -xzvf lab3-bundle.tar.gz

# awk can remove spaces
awk '!/^[[:space:]]*$/' lab3_data.tsv > clean_lab3_data.tsv

sed 's/'$'\t''/,/g' clean_lab3_data.tsv > lab3_data.csv

line_count=$(($(wc -l < lab3_data.csv) - 1)) 

echo "There are $line_count lines of data"

tar -czvf converted-archive.tar.gz lab3_data.csv 

