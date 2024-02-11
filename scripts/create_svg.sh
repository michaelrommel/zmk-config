#! /bin/bash

if [[ ! -f nightliner_keymap.yaml ]]; then
	echo "change into the ./images directory before you run this script"
	exit 255
fi

# keep copy of possibly modified config file around
cp nightliner_keymap.yaml nightliner_keymap_old.yaml
# take over the manual modifications
keymap -c keymap_drawer.config.yaml parse -b nightliner_keymap_old.yaml -z ../config/boards/arm/nightliner/nightliner.keymap >nightliner_keymap.yaml
# draw the keymap
keymap -c keymap_drawer.config.yaml draw -j nightliner_layout.json nightliner_keymap.yaml >nightliner_keymap.svg
# rsvg-convert -o nightliner_keymap.png -b "#282828" -z 3 -d 150 -p 150  nightliner_keymap.svg
inkscape -d 300 -b "#282828" -o nightliner_keymap.png nightliner_keymap.svg
