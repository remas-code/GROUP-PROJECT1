!/bin/bash
chmod 775 project.sh #allow owner to read/write/execute, other can read/execute

while true; do
    echo "Welcome to the travel budget planner :)"
    read -p "Enter the destination " destination
    read -p "How many month until you travel? " month_left
    read -p "Enter the total budget (in Riyals) " total_budget
    read -p "Do you want to add flight expenses? (yes/no) " add_flight
    
    #if the user want to add flight cost then subtract them from the total budget
    if [ "$add_flight" = "yes" ];then
        read -p "Enter the flight ticket cost: " flight_cost
        total_budget=$(("total_budget" - "$flight_cost"))
    fi    
