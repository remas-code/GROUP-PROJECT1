#!/bin/bash


echo "📆 Calculating monthly savings for all trips..."

# Clear the output file before writing new data
> trip_savings.txt

# Read the trip_data.txt file line by line, splitting by comma
while IFS=',' read -r destination months_left total_budget flight_cost total; do

    # Skip lines that are missing required fields
    if [[ -z "$destination" || -z "$months_left" || -z "$total" ]]; then
        continue
    fi

    # Initialize monthly saving variable
    monthly=0

    # Calculate monthly saving if months_left is greater than zero
    if [[ "$months_left" -gt 0 ]]; then
        # Use awk to calculate and format to 2 decimal places
        monthly=$(awk -v t="$total" -v m="$months_left" 'BEGIN { printf "%.2f", t / m }')
    else
        # If no time left, set monthly saving to "N/A"
        monthly="N/A"
    fi

    # Append the updated data to the new file
    echo "$destination,$months_left,$total_budget,$flight_cost,$total,$monthly" >> trip_savings.txt
done < trip_data.txt

# Replace the original file with the updated one
mv trip_savings.txt trip_data.txt


echo "✅ Monthly savings calculated and saved"

