echo -n "Enter CloudForms version: "
read version
echo

loc=~/csp/cloudforms/$version

for dir in $loc/*; do
	cd "$dir"/assembly/publican
	package=$(publican package --lang en-US | tail --lines=1)
    echo ${package#*rpm/}
done

echo