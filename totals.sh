#!/bin/bash

echo "🧮 Trip Cost Calculator" 
# Read each line from the input file
while read -r line; do
    # Skip empty lines
    if [ -z "$line" ]; then
        continue
    fi

# Check if input file exists
if [ ! -f trip_data.txt ]; then
    echo "❌ trip_data.txt not found. Please run the input script first."
else
    # Read the whole line from the file
    line=$(cat trip_data.txt)


    # Split values using cut
    destination=$(echo "$line" | cut -d',' -f1)
    months_left=$(echo "$line" | cut -d',' -f2)
    total_budget=$(echo "$line" | cut -d',' -f3)
    flight_cost=$(echo "$line" | cut -d',' -f4)


    # Check if required fields are present
    if [ -z "$destination" -z "$total_budget" ]; then
        continue

    # Validate required inputs
    if [ -z "$destination" ]  || [ -z "$months_left" ] || [ -z "$total_budget" ]; then
        echo "❌ Missing required information in input file."
    else
        # If flight_cost is missing, treat it as 0
        flight_cost=${flight_cost:-0}

        # Calculate total
        total=$(awk -v b="$total_budget" -v f="$flight_cost" 'BEGIN { print b + f }')

        # Print result
        echo "-----------------------------"
        echo "Destination:   $destination"
        echo "Months Left:   $months_left"
        echo "Budget:        $total_budget SAR"
        echo "Flight Cost:   $flight_cost SAR"
        echo "Total Cost:    $total SAR"
        echo "✅ Calculation complete."

    fi
fi

