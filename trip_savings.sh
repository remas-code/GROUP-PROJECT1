#!/bin/bash

echo "Calculating monthly savings for all trips..."

# Clear the output file before writing new data
> trip_savings.txt

# Read the trip_data.txt file line by line, splitting by comma
while read -r line; do
    destination=$(echo "$line" | cut -d',' -f1)
    months_left=$(echo "$line" | cut -d',' -f2)
    total_budget=$(echo "$line" | cut -d',' -f3)
    flight_cost=$(echo "$line" | cut -d',' -f4)

    # Skip lines that are missing required fields
    if [ -z "$destination" || -z "$months_left" || -z "$total" ]; then
        continue
    fi
    
   # Default flight_cost to 0 if empty
   flight_cost=$((flight_cost:-0))
    
   #Calculate total cost including flight
   total=$(( total_budget + flight_cost ))
   
    # Calculate monthly saving if months_left is greater than zero     
    fi
    if [ "$months_left" -gt 0 ]; then
        monthly=$(( total / months_left ))
    else
    # If no time left, set monthly saving to "N/A"
        monthly="N/A"
    fi

    # Append the updated data to the new file
    echo "$destination,$months_left,$total_budget,$flight_cost,$total,$monthly" >> trip_savings.txt
done < trip_data.txt

# Replace the original file with the updated one
mv trip_savings.txt trip_data.txt


echo "Monthly savings calculated and saved"

