#!/bin/bash

echo "📆 Calculating monthly savings for all trips..."

> trip_savings.txt

while IFS=',' read -r destination months_left total_budget flight_cost total; do
    if [[ -z "$destination" || -z "$months_left" || -z "$total" ]]; then
        continue
    fi

    monthly=0
    if [[ "$months_left" -gt 0 ]]; then
        monthly=$(awk -v t="$total" -v m="$months_left" 'BEGIN { printf "%.2f", t / m }')
    else
        monthly="N/A"
    fi

    echo "$destination,$months_left,$total_budget,$flight_cost,$total,$monthly" >> trip_savings.txt
done < trip_data.txt

mv trip_savings.txt trip_data.txt

echo "✅ Monthly savings calculated and saved."

