#!/bin/bash

# Usage: ./extract_creds.sh <directory>
#        ./extract_creds.sh          (searches current directory)

search_dir="${1:-.}"

if [[ ! -d "$search_dir" ]]; then
  echo "Error: '$search_dir' is not a directory." >&2
  exit 1
fi

found_any=false

while IFS= read -r -d '' file; do
  username=$(grep -E '^\s*username\s*:' "$file" | sed -E 's/^\s*username\s*:\s*//' | tr -d '"' | tr -d "'")
  password=$(grep -E '^\s*password\s*:' "$file" | sed -E 's/^\s*password\s*:\s*//' | tr -d '"' | tr -d "'")
  ssh_key_data=$(grep -E '^\s*ssh_key_data\s*:' "$file" | sed -E 's/^\s*ssh_key_data\s*:\s*//' | tr -d '"' | tr -d "'")
  ssh_key_unlock=$(grep -E '^\s*ssh_key_unlock\s*:' "$file" | sed -E 's/^\s*ssh_key_unlock\s*:\s*//' | tr -d '"' | tr -d "'")


  if [[ -n "$username" || -n "$password" ]]; then
    found_any=true
    echo "File: $file"
    echo "  username: ${username:-<not found>}"
    echo "  password: ${password:-<not found>}"
    echo "  ssh_key_data: ${ssh_key_data:-<not found>}"
    echo "  ssh_key_unlock: ${ssh_key_unlock:-<not found>}"
    echo ""
  fi

done < <(find "$search_dir" -type f -print0)

if [[ "$found_any" == false ]]; then
  echo "No credentials found in '$search_dir'."
fi