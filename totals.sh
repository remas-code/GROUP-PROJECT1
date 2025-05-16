#!/bin/bash
echo "Calculating total trip costs for all trips..."

# Create or empty the temporary file to store updated trip data
> trip_totals.txt

# Read each line from the input file
while read -r line; do
    # Skip empty lines
    if [[ -z "$line" ]]; then
        continue
    fi

    # Split the line into parts using 'cut'
    destination=$(echo "$line" | cut -d',' -f1)
    months_left=$(echo "$line" | cut -d',' -f2)
    total_budget=$(echo "$line" | cut -d',' -f3)
    flight_cost=$(echo "$line" | cut -d',' -f4)

    # Check if required fields are present
    if [[ -z "$destination"-z "$total_budget" ]]; then
        continue
    fi

    # If flight_cost is empty, set it to 0
    flight_cost=${flight_cost:-0}

    # Calculate the total cost (budget + flight)
    total=$(awk -v b="$total_budget" -v f="$flight_cost" 'BEGIN { print b + f }')

    # Write the updated line with total to the temporary file
    echo "$destination,$months_left,$total_budget,$flight_cost,$total" >> trip_totals.txt
done < trip_data.txt

# Replace the original file with the updated data
mv trip_totals.txt trip_data.txt

echo "Total trip costs calculated and saved."
