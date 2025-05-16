#!/bin/bash
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
        total_budget=$(("total_budget" - "flight_cost"))
    fi    
    
    total=$(awk -v b="$total_budget" -v f="$flight_cost" 'BEGIN { print b + f }')
    if [ "$month_left" -gt 0 ]; then
       monthly_saving=$(awk -v t="$total" -v m="$month_left" 'BEGIN { printf "%.2f", t / m }')
       echo ""
       echo " Destination $destination "
       echo " Budget $total_budget SAR "
       if [ "$flight_cost" -gt 0 ]; then
       echo " Flight cost : $flight_cost SAR "
       fi
       
       echo " Total : $total SAR "
       echo " You need to save monthly : $monthly_saving SAR "
       
       echo "$destination,$month_left,$total_budget SAR,$flight_cost SAR,$total SAR,$monthly_saving SAR/month" >> budget_plan.txt

    echo ""
    echo "Financial summary:"
    grep "SAR" budget_plan.txt

    echo ""
    echo "File permissions for budget_plan.txt:"
    ls -l budget_plan.txt

    echo ""
    read -p "Do you want to plan another trip? (y/n): " repeat
    if [ "$repeat" != "y" ]; then
        echo "Goodbye!"
        break
    fi
done

     

