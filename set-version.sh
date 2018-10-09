#!/bin/bash

read -p "Enter version:" version

mvn versions:set -DnewVersion=${version}

cd annot8-parent
mvn versions:set -DnewVersion=${version}
cd -

./git.sh commit -am "Bump to version $version"

# The backup files are still around to delete or revert
# mvn versions:commit
# mvn versions:revert

