#!/bin/bash

# Source the functions from external files
source trip_budget.sh
source totals.sh
source trip_savings.sh
source report.sh  # renamed from generate_report.sh

# Main function to run all steps
main() {
    input_trip_data
    calculate_totals
    calculate_saving
    report  
}

# Run the main function
main
