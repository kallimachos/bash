#/bin/bash

bash ~/scripts/bash/repocheck.sh
echo -n "Proceed with git clean? (y/n): "
read proceed
if [ "$proceed" != "y" ]; then
	exit
else
    echo "Cleaning git repos..."
fi

echo
echo 'OpenStack Repositories:'
for dir in ~/openstack/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir && git clean -xfd
	fi
done
echo

echo 'Rackspace Repositories:'
for dir in ~/rpcdocs/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir && git clean -xfd
	fi
done
echo

echo 'My GitHub Repositories:'
for dir in ~/code/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir && git clean -xfd
	fi
done

for dir in ~/code/python/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir && git clean -xfd
	fi
done

for dir in ~/scripts/*; do
	if test -d $dir && test -e $dir/.git; then
        cd $dir && git clean -xfd
	fi
done
echo
