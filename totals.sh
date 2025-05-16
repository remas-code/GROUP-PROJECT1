#!/bin/bash
calculate_totals(){
  echo "Calculating total trip costs for all trips..."  
  > trip_totals.txt


 while read -r line; do
    
    # Split the line into parts using 'cut'
    destination=$(echo "$line" | cut -d',' -f1)
    months_left=$(echo "$line" | cut -d',' -f2)
    total_budget=$(echo "$line" | cut -d',' -f3)
    flight_cost=$(echo "$line" | cut -d',' -f4)

    # Check if required fields are present
    if [ -z "$destination" ] || [ -z "$total_budget" ] || [ -z "$total_budget" ]; then
      echo "Skipping incomplete record"
    else     
       flight_cost=${flight_cost:-0}
       total=$(awk -v b="$total_budget" -v f="$flight_cost" 'BEGIN { print b + f }')
       echo "$destination,$months_left,$total_budget,$flight_cost,$total" >> trip_totals.txt
    fi
 done < trip_data.txt

# Replace the original file with the updated data
 mv trip_totals.txt trip_data.txt
 echo "totals added.." 
}

