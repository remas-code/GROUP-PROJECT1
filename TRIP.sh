#!/bin/bash

calculate_totals(){
    echo "Calculating total trip costs for all trips..."

    > trip_totals.txt

    while read -r line; do
        # Skip empty lines
        if [ -n "$line" ]; then
            # Extract fields using cut
            destination=$(echo "$line" | cut -d',' -f1)
            months_left=$(echo "$line" | cut -d',' -f2)
            total_budget=$(echo "$line" | cut -d',' -f3)
            flight_cost=$(echo "$line" | cut -d',' -f4)

            # Only process if destination and budget are not empty
            if [[ -n "$destination" && -n "$total_budget" ]]; then
                # Default flight_cost to 0 if empty
                flight_cost=${flight_cost:-0}

                # Calculate total
                total=$(awk -v b="$total_budget" -v f="$flight_cost" 'BEGIN { print b + f }')

                # Write to output
                echo "$destination,$months_left,$total_budget,$flight_cost,$total" 
           >> trip_totals.txt
            fi
        fi
    done < trip_data.txt

    mv trip_totals.txt trip_data.txt
}

