#!/bin/bash

# Function to create and print a budget summary report
report() {

    # Print the report header
    echo "===== Budget Plan Summary ====="
    
    # Set the output file name
    report_file="trip_summary.txt"

    # Clear the contents of the report file
    > "$report_file"

    # Read each line from the input file
    while read -r line; do
        # Extract values from the line (CSV format)
        destination=$(echo "$line" | cut -d',' -f1)
        months_left=$(echo "$line" | cut -d',' -f2)
        total_budget=$(echo "$line" | cut -d',' -f3)
        flight_cost=$(echo "$line" | cut -d',' -f4)
        total=$(echo "$line" | cut -d',' -f5)
        monthly=$(echo "$line" | cut -d',' -f6)

        # If destination is not empty, write the details to the report
        if [ ! -z "$destination" ]; then
            echo "" >> "$report_file"
            echo "Destination: $destination" >> "$report_file"
            echo "Total Budget: $total SAR" >> "$report_file"
            echo "Months Until Trip: $months_left" >> "$report_file"
            echo "→ You need to save: $monthly SAR per month" >> "$report_file"
        fi
    done < trip_data.txt

    # Print the report file to the screen
    cat "$report_file"
    
    # Print confirmation message
    echo ""
    echo "Totals added and summary printed."
}

