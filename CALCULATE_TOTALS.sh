#!/bin/bash

# Function to calculate total cost per trip
calculate_totals() {
    echo "Calculating total trip costs..."
    > trip_totals.txt

    while read -r line; do
        destination=$(echo "$line" | cut -d',' -f1)
        months_left=$(echo "$line" | cut -d',' -f2)
        total_budget=$(echo "$line" | cut -d',' -f3)
        flight_cost=$(echo "$line" | cut -d',' -f4)

        # Skip processing if important fields are empty
        if [ -z "$destination" ] || [ -z "$months_left" ] || [ -z "$total_budget" ]; then
            echo "Skipping incomplete record: $line"
        else
            flight_cost=${flight_cost:-0}
            total=$(awk -v b="$total_budget" -v f="$flight_cost" 'BEGIN { print b + f }')
            echo "$destination,$months_left,$total_budget,$flight_cost,$total" >> trip_totals.txt
        fi
    done < trip_data.txt

    mv trip_totals.txt trip_data.txt
    echo "Totals added."
}

