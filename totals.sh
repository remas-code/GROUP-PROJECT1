#!/bin/bash

echo "🧮 Calculating total trip costs for all trips..."

# ملف جديد للنتيجة المؤقتة
> trip_totals.txt

while IFS=',' read -r destination months_left total_budget flight_cost; do
    # تخطي الأسطر الفارغة أو غير المكتملة
    if [[ -z "$destination" || -z "$months_left" || -z "$total_budget" ]]; then
        continue
    fi

    # إذا flight_cost غير معطى نعتبره 0
    flight_cost=${flight_cost:-0}

    total=$(awk -v b="$total_budget" -v f="$flight_cost" 'BEGIN { print b + f }')

    # نكتب السطر مع الإجمالي
    echo "$destination,$months_left,$total_budget,$flight_cost,$total" >> trip_totals.txt
done < trip_data.txt

# استبدل ملف البيانات الأصلي بالملف الجديد
mv trip_totals.txt trip_data.txt

echo "✅ Total trip costs calculated and saved."

