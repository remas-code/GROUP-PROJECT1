#!/bin/bash

# Load all function files
source test1.sh
source test2.sh
source test3.sh
source test4.sh

# Clear old data
> input.txt
> output.txt
> budget_plan.txt

# Start input loop
while true; do
    get_inputs

    read -p "Do you want to add another trip? (y/n): " answer
    if [[ "$answer" != "y" ]]; then
        break
    fi
done

# Call calculate only once AFTER all trips are added
calculate_saving

# Show and save results
display_result
save_to_file

