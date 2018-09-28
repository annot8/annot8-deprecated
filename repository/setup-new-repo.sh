#!/bin/bash



if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [path/to/new/repo/"
    exit 1
fi

echo "This script assumes that $1 is a public repo, cloned from GitHub"


cp files/* $1/.
cp scripts/* $1/.
cp -r hooks $1/hooks

cd travis
./setup-travis $1
cd -

echo "cd $1; git commit -am 'Setup repository'"

