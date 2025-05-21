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

<div style=\"display: flex; flex-direction: column; gap: 10px;\">

  <img src=\"/assets/images/vmrbiomarker_${id}__male.png\" alt=\"${menu_name} VMR Male\" style=\"margin-left: 15%\">
  <img src=\"/assets/images/rr_${id}__male.png\" alt=\"${menu_name} RR Male\">

  <img src=\"/assets/images/vmrbiomarker_${id}__female.png\" alt=\"${menu_name} VMR Female\" style=\"margin-left: 15%; \">
  <img src=\"/assets/images/rr_${id}__female.png\" alt=\"${menu_name} RR Female\">

</div>


" > ../biomarker/${id}.md


done
