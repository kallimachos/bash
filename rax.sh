#bin/bash

# Opens secure shells (SSH) to the listed IP addresses.

controller="119.9.128.75"
compute="119.9.128.77"
block="119.9.128.78"
object="119.9.128.79"

declare -A ip=( ["1"]=$controller ["2"]=$compute ["3"]=$block ["4"]=$object )

foo=""

echo "Opening tabs in a new window..."

for item in "${!ip[@]}"; do
    echo "$item - ${ip["$item"]}"
    foo+=(--tab -e "bash -c 'ssh root@${ip["$item"]}';bash")
done

gnome-terminal "${foo[@]}"

exit 0
