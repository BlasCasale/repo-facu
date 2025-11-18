#!/bin/bash

if [ $# -ne 1 ]; then
  echo "se debe enviar la extensión a buscar"
  exit 1
fi

declare -A counter

while read file; do
  user=$(ls -l "$file" | awk '{print $3}')
  ((counter[$user]++))
done < <(find C:/Users/ASUS/Documents C:/Users/ASUS/Downloads C:/Users/ASUS/Desktop -name "*$1" 2>/dev/null)

for user in "${!counter[@]}"; do
  echo "$user: ${counter[$user]}"
done > "reporte.txt"