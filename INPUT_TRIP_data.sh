#!/bin/bash

# Function to input trip data from the user
input_trip_data() {
    echo "Enter Trip Information"
    echo "Type 'no' as destination to stop entering data."
    > trip_data.txt  

    while true; do
        read -p "Travel Destination: " destination
        if [ "$destination" = "no" ]; then
            echo "Data entry stopped."
            break
        fi

        read -p "How many months until you travel? " months_left
        read -p "Total Budget (SAR): " total_budget
        read -p "Do you want to add flight cost? (yes/no): " add_flight

        flight_cost=0
        if [ "$add_flight" = "yes" ]; then
            read -p "Flight Ticket Cost (SAR): " flight_cost
        fi

        echo "$destination,$months_left,$total_budget,$flight_cost" >> trip_data.txt
        echo "Trip data saved for $destination."
    done
}

