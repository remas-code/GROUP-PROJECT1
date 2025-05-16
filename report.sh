#!/bin/bash

# Function to display the budget plan summary
report() {
    echo "===== Budget Plan Summary =====" > trip_report.txt

    while read -r line; do
        destination=$(echo "$line" | cut -d',' -f1)
        months_left=$(echo "$line" | cut -d',' -f2)
        total_budget=$(echo "$line" | cut -d',' -f3)
        monthly=$(echo "$line" | cut -d',' -f6)

        if [ -z "$destination" ]; then
            continue
        fi

        {
            echo ""
            echo "Destination: $destination"
            echo "Total Budget: ${total_budget} SAR"
            echo "Months Until Trip: $months_left"
            echo "→ You need to save: ${monthly} SAR per month"
        } >> trip_report.txt
    done < trip_data.txt

    cat trip_report.txt
    echo ""
    echo "Totals added and summary printed."
}

