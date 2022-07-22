#!/bin/bash

CURRENT_DIR=$( pwd )                    # Find the current working directory
SECONDS=0

if [[ $2 ]]
then
        SECONDS=$2
fi

echo "Sleeping for $SECONDS second(s) "; echo
sleep $SECONDS				# This is based on the time it takes to render video from Resolve

filename="Export 1.mov"

cd "$CURRENT_DIR/$1/03 Exports/"

render_video () {
	echo "Running Handbrak CLI"; echo
        HandBrakeCLI --preset-import-file "$CURRENT_DIR/handbrake-preset.json" -i 'Export 1.mov' -o 'Export 1 (Compressed).m4v' -a 1
        echo; echo
        echo "Handbrake Compression Complete!!! 🥳🥳🎆🎆"; echo
}

if [[ -f $filename ]]
then
	render_video
else
	echo "$filename does not exist 😔. Please try again later."
fi

exit 0
