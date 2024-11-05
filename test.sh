#!/bin/bash

# Define the directory to search (current directory by default)
SEARCH_DIR="${1:-.}"

# Define a regex pattern to match potential passwords
PASSWORD_REGEX='(password|pwd|secret|key|token|pass|access|apikey|auth|credential|secretkey|jwt)[\s:=]*([\'\"]?)([^\'\" ]+)\2'

# Search for potential passwords in the specified directory
echo "Searching for potential passwords in directory: $SEARCH_DIR"
grep -r -E -o "$PASSWORD_REGEX" "$SEARCH_DIR"

# Optionally, you can also search for other common patterns that might indicate passwords
echo "Searching for common password patterns..."
grep -r -E -o '[^: ]{6,}[ ]*:[ ]*[^: ]{6,}' "$SEARCH_DIR"  # for key-value pairs

# Finished
echo "Search completed."
