#!/bin/sh
TARGET_TAR=/mnt/SATA_HDD/backup/thunderbird_mail.tar
MAIL_DIR=/home/cdarkz/.thunderbird/

if [ -e "${TARGET_TAR}.bz2" ]; then
	echo "Update backup file ${TARGET_TAR}.bz2"
	/bin/bunzip2 ${TARGET_TAR}.bz2
	/bin/tar -uf ${TARGET_TAR} -C $(dirname ${MAIL_DIR}) $(basename ${MAIL_DIR})
	/bin/bzip2 ${TARGET_TAR}
else
	echo "Create backup file ${TARGET_TAR}.bz2"
	/bin/tar jcf ${TARGET_TAR}.bz2 -C $(dirname ${MAIL_DIR}) $(basename ${MAIL_DIR})
fi
