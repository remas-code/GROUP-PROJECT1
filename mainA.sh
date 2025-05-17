#!/bin/bash

# Source the functions from capitalized script files
source INPUT_TRIP_DATA.sh
source CALCULATE_TOTALS.sh
source CALCULATE_SAVING.sh
source REPORT.sh

# Main function to run all steps
main() {
    input_trip_data
    calculate_totals
    calculate_saving
    report
}

# Run the main function
main
