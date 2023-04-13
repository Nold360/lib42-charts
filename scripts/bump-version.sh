#!/bin/bash
set -u
set -e

chart="$1"
VERSION=$(awk '/^version:/ { print $2 }' "${chart}/Chart.yaml")
NEWVERSION=$(echo $VERSION | awk -F. '/[0-9]+\./{$NF++;print}' OFS=.)
sed "s/$VERSION/$NEWVERSION/" -i "${chart}/Chart.yaml"
git add "${chart}/Chart.yaml"
exit 0
