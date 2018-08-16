#!/bin/bash

# Factorio Backup
# This script creates a backup of the newest save file
# if needed to Google Drive
echo Running Factorio backup: $(date) "|" $(pwd)

temp_dir=/tmp/factorio_backup

# Make temp directory
mkdir $temp_dir

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
	cp $newest $temp_dir/mod_squad.zip
	mv $temp_dir/mod_squad.zip $temp_dir/mod_squad_$(date +%H_%M___%m_%d_%Y).zip

	# Upload save to Google Drive (parent is mod_factorio folder in Drive)
	gdrive upload --parent 1_Q_FMHg09em1YqWOjSQ2cckGoXp4mCO0 $temp_dir/*
	cp $temp_dir/* /home/lucas/mod_factorio/saves/mod_squad_last_backup.zip

	echo "Backup has been made."
else
	echo No newer backup found.
fi
# No longer need temp directory
rm -rf $temp_dir

exit 0
