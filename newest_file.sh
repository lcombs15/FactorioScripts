#!/bin/bash

# Make file array of all game saves
files=($(find /home/lucas/mod_factorio/ -maxdepth 3 -name '*.zip'))

# Assume the first file is the newest
newest=${files[0]}

for f in ${files[@]}; do
	if [ "$f" -nt "$newest" ]; then
		newest=$f
	fi
done

echo The newest file is:
ls -l -altrh $newest
