#!/bin/bash

# Directory containing HTML files (replace with your target directory)
directory="_site"

find "$directory" -type f -name "*.html" | while read -r file; do
    # Use Perl to remove <footer> tags and their content
    perl -i -0777 -pe 's/<footer\b[^>]*>(.*?)<\/footer>//gs' "$file"
    echo "Processed $file"
done

grep -r '#7253ed' _site/assets/css/ | cut -d':' -f 1 | sort | uniq | xargs sed -i 's/#7253ed/#056cb6/g'

site_dir="_site"

analytics_snippet='<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-HJFLFE2E2S"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag("js", new Date());

  gtag("config", "G-HJFLFE2E2S");
</script>'

# Loop through each HTML file in the _site directory
find "$site_dir" -type f -name "*.html" | while read -r file; do
  # Use awk to insert the snippet right after the <head> tag
  awk -v snippet="$analytics_snippet" '
    /<head>/ { print; print snippet; next }
    { print }
  ' "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
done

echo "Google Analytics snippet added after the <head> tag in each HTML file in the _site directory."


