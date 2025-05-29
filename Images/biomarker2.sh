#!/bin/bash

# Input file
file="biomarker2.tsv"



tail -n +2 "$file" | while IFS=$'\t' read -r id cat menu_name desc; do

cat_name=$(awk -F $'\t' -v key="$cat" '$1 == key { print $2 }' biomarker_cat.tsv)


echo "$cat $menu_name $desc $cat_name"

echo "---
title: \"$menu_name\"
parent: \"$cat_name\"
grand_parent: \"Risk by Biomarker\"
---


## $menu_name


$desc

<div style=\"display: flex; flex-direction: column; gap: 10px;\">

  <img src=\"/assets/images/vmrbiomarker_${id}__male.png\" alt=\"${menu_name} VMR Male\" style=\"margin-left: 15%\">
  <img src=\"/assets/images/rr_${id}__male.png\" alt=\"${menu_name} RR Male\">

  <img src=\"/assets/images/vmrbiomarker_${id}__female.png\" alt=\"${menu_name} VMR Female\" style=\"margin-left: 15%; \">
  <img src=\"/assets/images/rr_${id}__female.png\" alt=\"${menu_name} RR Female\">

</div>


" > ../biomarker/${id}.md


done
