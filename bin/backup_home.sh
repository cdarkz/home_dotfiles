#!/bin/bash
SRC_DIR=(~/.thunderbird ~/Documents ~/Pictures ~/kermit_log /mnt/Desktop_server/kermit_log)
TARGET_NAME=("thunderbird_mail.tar" "home_Documents.tar" "home_Pictures.tar" "home_kermit_log.tar" "desktop_kermit.tar")
TARGET_PATH=/mnt/SATA_HDD/backup

for i in "${!SRC_DIR[@]}"; do
    TARGET_TAR=${TARGET_PATH}/${TARGET_NAME[$i]}

    echo "Create backup file ${TARGET_TAR}.bz2"
    /bin/tar jcf ${TARGET_TAR}.bz2 -C $(dirname ${SRC_DIR[$i]}) $(basename ${SRC_DIR[$i]})
done

