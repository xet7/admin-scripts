#!/usr/bin/env sh

# Check if a file argument was provided
if [ -z "$1" ]; then
    echo "Usage: dedup <filename>" >&2
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found." >&2
    exit 1
fi

# Remove duplicate lines while preserving original line order
awk '!seen[$0]++' "$1"
