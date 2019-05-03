for combo in $(curl -s https://raw.githubusercontent.com/Dot-Extended/android_vendor_dot/pie/dot.devices | sed -e 's/#.*$//' | awk '{printf "dot_%s-%s\n", $1, $2}')
do
    add_lunch_combo $combo
done
