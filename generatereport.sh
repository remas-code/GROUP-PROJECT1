#!/bin/bash

echo "📋 Generating budget report for all trips..."

report_file="budget_plan.txt"

{
    echo "----------------------------------------"
    echo "           Travel Budget Report          "
    echo "----------------------------------------"
} > "$report_file"

while IFS=',' read -r destination months_left total_budget flight_cost total monthly; do
    if [[ -z "$destination" ]]; then
        continue
    fi

    {
        echo "Destination     : $destination"
        echo "Months Left     : $months_left"
        echo "Total Budget    : $total_budget SAR"
        echo "Flight Cost     : $flight_cost SAR"
        echo "Total Trip Cost : $total SAR"
        echo "Monthly Saving  : $monthly SAR"
        echo "----------------------------------------"
    } >> "$report_file"
done < trip_data.txt

echo "✅ Report generated in $report_file"

echo ""
echo "📊 Financial summary from report:"
grep "SAR" "$report_file"

echo ""
echo "🔒 File permissions:"
ls -l "$report_file"

