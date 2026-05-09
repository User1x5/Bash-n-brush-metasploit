#!/usr/bin/bash

search_metasploit_files() {
  local search_dir="${1:-/}"
  find "$search_dir" -type f \( -iname '*metasploit*' -o -iname '*msf*' \) 2>/dev/null
}

search_metasploit_stage() {
  local search_dir="${1:-/}"
  find "$search_dir" -type f \( -iname '*stage*' -o -iname '*stager*' \) 2>/dev/null | grep -Ei 'metasploit|msf|stage'
}

search_metasploit() {
  local search_dir="${1:-/}"
  search_metasploit_files "$search_dir"
  search_metasploit_stage "$search_dir"
}

# Main script
if [[  "$1" == "--help" ]]; then
    echo "Usage: $0 -s (Searches for metasploit files)"
    echo "Usage: $0 -t (Searches for "stage")