#!/bin/bash

# Input file
file="disease.tsv"

# Read the header line to extract column names
read -r header < "$file"
header=$(head -n 1 "$file" | tr -d '\r' | xargs)

# Split the header line into an array of column names

# Print columns for debugging (optional)


#tail -n +2 "$file" | while IFS=$'\t' read -r "${columns[@]}"; do
  # Now each column is a variable named after the header
  #echo "Name: $name, Age: $age, City: $citiy"

  # Access each variable named after the header column names
  tail -n +2 "$file" | while IFS=$'\t' read -r id menu_name long_name marker_desc vmr_desc vmr_note rr_desc rr_note; do

echo "---
title: $menu_name
parent: \"Risk by Disease\"
---


## $long_name


$marker_desc


$vmr_desc


![${menu_name}vmr](/assets/images/table_${id}.jpg)


The table below contains $long_name risk ratios for each of the included biomarkers.


![${menu_name}rr](/assets/images/disease_rr_${id}.jpg)

" > ../disease/${id}.md


done
