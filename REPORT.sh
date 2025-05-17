#!/bin/bash

# Function to print a clean summary report
report() {
    echo "===== Budget Plan Summary ====="
    report_file="trip_summary.txt"
    > "$report_file"

    while read -r line; do
        destination=$(echo "$line" | cut -d',' -f1)
        months_left=$(echo "$line" | cut -d',' -f2)
        total_budget=$(echo "$line" | cut -d',' -f3)
        flight_cost=$(echo "$line" | cut -d',' -f4)
        total=$(echo "$line" | cut -d',' -f5)
        monthly=$(echo "$line" | cut -d',' -f6)

        if [ ! -z "$destination" ]; then
            echo "" >> "$report_file"
            echo "Destination: $destination" >> "$report_file"
            echo "Total Budget: $total SAR" >> "$report_file"
            echo "Months Until Trip: $months_left" >> "$report_file"
            echo "→ You need to save: $monthly SAR per month" >> "$report_file"
        fi
    done < trip_data.txt

    cat "$report_file"
    echo ""
    echo "Totals added and summary printed."
}

