#!/bin/bash

# Add -X option if syncing to compatible filesystem (e.g. EXT4)

if [ "$1" = "all" ]; then
	sudo rsync -azvACHS --delete --progress --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/","/lost+found/"} /* /run/media/bmoss/FreeAgent\ GoFlex\ Drive/FedoraBackup/
else
	rsync -azvACHS --delete --progress --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/","/media/","/lost+found/"} /home/bmoss/ /run/media/bmoss/FreeAgent\ GoFlex\ Drive/FedoraBackup/home/bmoss/
fi
