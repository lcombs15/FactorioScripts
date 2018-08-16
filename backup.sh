#!/bin/bash

# May 2018 - Backup mod_factorio files to Google Drive
echo Running mod_factorio backup: $(date)

# Make temp directory
mkdir /tmp/mod_factorio

# Make file array of all game saves
files=($(find /home/lucas/mod_factorio/ -maxdepth 3 -name '*.zip'))

# Assume the first file is the newest
newest=${files[0]}

# Find newest file
for f in ${files[@]}; do
	if [ $f -nt $newest ]; then
		newest=$f
	fi
done

if [ $newest -nt /home/lucas/mod_factorio/saves/mod_squad_last_backup.zip ]; then

	# Copy and timestamp save file
	cp $newest /tmp/mod_factorio/mod_squad.zip
	mv /tmp/mod_factorio/mod_squad.zip /tmp/mod_factorio/mod_squad_$(date +%H_%M___%m_%d_%Y).zip

	# Upload save to Google Drive (parent is mod_factorio folder in Drive)
	gdrive upload --parent 1_Q_FMHg09em1YqWOjSQ2cckGoXp4mCO0 /tmp/mod_factorio/*
	cp /tmp/mod_factorio/* /home/lucas/mod_factorio/saves/mod_squad_last_backup.zip

	echo "Backup has been made."
else
	echo No newer backup found.
fi
# No longer need temp directory
rm -rf /tmp/mod_factorio

exit 0
