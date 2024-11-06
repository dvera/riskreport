#!/bin/bash

# Input file
file="biomarker.tsv"

  tail -n +2 "$file" | while IFS=$'\t' read -r id menu_name bio_desc; do

echo "---
title: $menu_name
parent: \"Risk by Biomarker\"
---


## $menu_name


$bio_desc


![${menu_name}rr](/assets/images/rr_${id}.png)



" > ../biomarker/${id}.md


done
