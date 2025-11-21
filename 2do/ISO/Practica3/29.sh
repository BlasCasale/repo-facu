#!/bin/bash

owner=$(whoami)

files=()

for file in *; do
  if [ -x "$file" -a -f "$file" ]; then
    files+=("$file")
  fi
done

for file in "${files[@]}"; do
  echo "se movio $(basename $file)"
  mv -f "$file" "/home/bin"
done

echo "se movieron ${#files[@]} archivos"