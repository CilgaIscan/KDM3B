#!/bin/bash
for item in *; do
	# If item is a file - don't do a thing on it
	if [ -f "$item" ]
	then
		echo "Skipping $item because it is not a directory"
		continue
	fi
	FILENAME="File_metada_""$item"".txt"
	cd "$item"
	echo "Downloading metadata to file $FILENAME..."
	curl --request POST --header "Content-Type: application/json" --data @Payload2.txt "https://gdc-api.nci.nih.gov/files" > "$FILENAME"
	cd ../
done
