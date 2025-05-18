#!/bin/bash

# Function to input trip data from the user
input_trip_data() {
#Display welcome massage and instructions
    echo "Welcome to the travel budget planner :)"
    echo "Plase Enter your Trip Information"
    echo "Type 'no' as destination to stop entering data."
    > trip_data.txt  # Clear existing data

    while true; do
        read -p "Travel Destination: " destination 
        #if user type 'no', stop the loop
        if [ "$destination" = "no" ]; then
            echo "Data entry stopped."
            break
        fi
        #Get trip timing, total budget, and ask about flight cost
        read -p "How many months until you travel? " months_left
        read -p "Total Budget (SAR): " total_budget
        read -p "Do you want to add flight cost? (yes/no): " add_flight

        #set default flight cost to 0 in case its not added
        flight_cost=0
        # Ask for flight cost if user chose yes
        if [ "$add_flight" = "yes" ]; then
            read -p "Flight Ticket Cost (SAR): " flight_cost
        fi
        #Append all trip data to file
        echo "$destination,$months_left,$total_budget,$flight_cost" >> trip_data.txt
        #Confirm the user that data was saved
        echo "Trip data saved for $destination."
    done
}

