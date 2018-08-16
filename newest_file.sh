#!/bin/bash

# newest_file.sh
# Lucas Combs
# 16 August 2018
# github.com/lcombs15

# Find newest Factorio .zip save, display info about file

# Make file array of all game saves
files=($(find $(pwd) -maxdepth 3 -name '*.zip'))

# Assume the first file to be the newest
newest=${files[0]}

# Loop through all files found
for f in ${files[@]}; do
	# If current file f is newer, record it
	if [ "$f" -nt "$newest" ]; then
		newest=$f
	fi
done

# Print result
echo The newest file is:

# Display file info with disk usage formatting
# This shows 2K rather than 2048 (bytes)
ls -ltrh $newest
