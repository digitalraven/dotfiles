#! /bin/bash

ALBUM_NAME=$(curl "$1" | grep 'title has-text-centered' | cut -d '"' -f6 | head -n1);
mkdir "$ALBUM_NAME" && cd "$ALBUM_NAME";

curl "$1" | grep 'id="file"' | cut -d '"' -f6 > LINKS;
wget -i LINKS -q --show-progress;
rm LINKS;
