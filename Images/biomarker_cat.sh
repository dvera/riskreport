#!/bin/bash

# Input file
file="biomarker_cat2.txt"
file2="biomarker_cat3.tsv"

iconv -f UTF-16LE -t UTF-8 $file | sed 's/^"\(.*\)"$/\1/; s/"//g' > ${file2}

#cats=$(cut -f 2 biomarker2.tsv | sort | uniq)

tail -n +2 "$file2" | while IFS=$'\t' read -r cat menu_name desc order; do

echo "$cat $menu_name $desc"

echo "---
title: \"$menu_name\"
parent: \"Risk by Biomarker\"
has_children: TRUE
nav_order: $order
---


## $menu_name


$desc

" | sed 's/^"\(.*\)"$/\1/' > ../biomarker/${cat}.md

done



#| 
#awk '
#BEGIN {
#  FS="\",\""; OFS="\t"
#}
#NR == 1 {
#  sub(/^"/, "", $1)
#  sub(/"$/, "", NF)
#}
#NR > 1 {
#  sub(/^"/, "", $1)
#  sub(/"$/, "", $NF)
#}
#{
#  print
#}' |