#!/bin/bash

# Source the functions from external files
source input_trip_data.sh
source calculate_totals.sh
source calculate_saving.sh
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
