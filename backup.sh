#! /bin/bash

sudo rsync -azvnACHS --progress --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} /* /run/media/bmoss/FreeAgent\ GoFlex\ Drive/FedoraBackup/