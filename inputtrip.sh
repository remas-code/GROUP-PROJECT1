#!/bin/bash

echo "📝 Enter Trip Information"
echo "Type 'no' as destination to stop entering data."

# نهيئ ملف البيانات (نمسحه أولًا لو موجود)
> trip_data.txt

while true; do
    read -p "Travel Destination: " destination
    if [[ "$destination" == "no" ]]; then
        echo "✅ Data entry stopped."
        break
    fi

    read -p "How many months until you travel? " months_left
    read -p "Total Budget (SAR): " total_budget
    read -p "Do you want to add flight cost? (y/n): " add_flight

    flight_cost=0
    if [[ "$add_flight" == "y" ]]; then
        read -p "Flight Ticket Cost (SAR): " flight_cost
    fi

    # Append data (سطر جديد لكل رحلة)
    echo "$destination,$months_left,$total_budget,$flight_cost" >> trip_data.txt

    echo "✅ Trip data saved for $destination."
done

echo "All trip data saved to trip_data.txt"

