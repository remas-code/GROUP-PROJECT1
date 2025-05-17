#!/bin/bash

# Function to calculate monthly savings needed for each trip
calculate_saving() {
    echo "Calculating monthly savings..."
    
   # Clear the output file before writing new data
    > trip_savings.txt

# Read the trip_data.txt file line by line, splitting by comma
    while read -r line; do
        destination=$(echo "$line" | cut -d',' -f1)
        months_left=$(echo "$line" | cut -d',' -f2)
        total_budget=$(echo "$line" | cut -d',' -f3)
        flight_cost=$(echo "$line" | cut -d',' -f4)
        total=$(echo "$line" | cut -d',' -f5)

       #Sikp empty or incomplate liines
        if [ -z "$destination" ] || [ -z "$months_left" ] || [ -z "$total" ]; then
            continue
        fi
 
       #Calculate monthly saving if months_left is greater than zero  
        if [ "$months_left" -gt 0 ]; then
            monthly=$(awk -v b="$total_budget" -v f="$flight_cost" -v m="$months_left" 'BEGIN { printf "%.2f", (b + f) / m }')
        else
            monthly="N/A" #If no time left, monthly saving is not available
        fi

    # Append the updated data to the new file

        echo "$destination,$months_left,$total_budget,$flight_cost,$total,$monthly" >> trip_savings.txt
        done < trip_data.txt
  
  # Replace the original file with the updated one
    mv trip_savings.txt trip_data.txt
    
    echo "Monthly savings calculated."
}
   

