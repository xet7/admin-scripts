#!/bin/bash

# Reset the built-in Bash timer to 0
SECONDS=0
counter=0

while true; do
    ((counter++))
    # Calculate hours and remaining seconds
    hours=$((SECONDS / 3600))
    seconds=$((SECONDS % 60))
    # Print the counter and time in HH:SS format
    # \r keeps the output on the exact same line
    printf "Iteration: %-5d | Elapsed Time: %02d:%02d\r" "$counter" "$hours" "$seconds"
    sync
    sleep 1
    # Note: 'sleep 1' isn't perfectly accurate to the millisecond, 
    # but $SECONDS will always reflect true elapsed wall-clock time.
done
