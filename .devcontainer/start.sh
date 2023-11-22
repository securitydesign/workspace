#!/bin/sh

cp .devcontainer/tools/admci /usr/bin
cp .devcontainer/tools/localci /usr/bin

echo "--------------------"
echo
echo
echo "ADDB is available at /usr/share/addb"
echo "In ADSM YAML, set \"addb:/usr/share/addb\" to read from ADDB repository"
echo
echo
echo "--------------------"