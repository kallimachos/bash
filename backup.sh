#!/bin/bash

# Runs rsync to back up system to external HD.
# Add -X option if syncing to compatible filesystem (e.g. EXT4)

if [ "$1" = "all" ]; then
    sudo rsync -azvACHS --delete \
    --progress --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/"} \
    --exclude={"/media/","/lost+found/"} /* \
    /run/media/bmoss/FreeAgent\ GoFlex\ Drive/FedoraBackup/
else
    rsync -azvACHS --delete \
    --progress --exclude={"/dev/","/proc/","/sys/","/tmp/","/run/","/mnt/"} \
    --exclude={"/media/","/lost+found/",".gem/",".ICEauthority/"} \
    --exclude={".macromedia/",".pki/",".shutter/",".gimp-2.8/",".java/"} \
    --exclude={".mozilla/",".python_history/",".adobe/",".cache/"} \
    --exclude={".dropbox/",".gnome2/",".gnome2_private/",".novaclient/"} \
    --exclude={".thumbnails/",".bash_history/",".dropbox-dist/",".gnupg/"} \
    --exclude={".tox/",".bash_logout/",".esd_auth/",".gphoto/",".m2/"} \
    /home/bmoss/ \
    /run/media/bmoss/FreeAgent\ GoFlex\ Drive/FedoraBackup/home/bmoss/
fi
