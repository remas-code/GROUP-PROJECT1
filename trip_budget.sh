#!/bin/bash


input_trip_data(){
  echo "Welcome to the travel budget planner :)"
  echo "Enter your trip information: "
  echo "Type 'no' as destination to stop entering data."
  > trip_data.txt 

#loop to collect user trip info
  while true; do
     read -p "Travel Destination: " destination
     if [ "$destination" == "no" ]; then
        echo " Data entry stopped."
        break
     fi

    read -p "How many months until you travel? " months_left
    read -p "Total Budget (SAR): " total_budget
    read -p "Do you want to add flight cost? (y/n): " add_flight

    # optional add flight Ticket Cost
    if [ "$add_flight" = "yes" ];then
        read -p "Enter the flight ticket cost: " flight_cost
        
        total_budget=$(("total_budget" - "flight_cost"))
    fi
    # Append data 
    echo "$destination,$months_left,$total_budget,$flight_cost" >> trip_data.txt

    echo "Trip data saved for $destination."
  done

}
