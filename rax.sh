#bin/bash

controller="119.9.128.75"
compute1="119.9.128.77"
block1="119.9.128.78"
object1="119.9.128.79"
object2="119.9.23.71"

declare -A ip=( ["1"]=$controller ["2"]=$compute1 ["3"]=$block1 ["4"]=$object1 ["5"]=$object2 )

foo=""

echo "Opening tabs in a new window..."

for item in "${!ip[@]}"; do
    echo "$item - ${ip["$item"]}"
    foo+=(--tab -e "bash -c 'ssh root@${ip["$item"]}';bash")
done

gnome-terminal "${foo[@]}"

exit 0
