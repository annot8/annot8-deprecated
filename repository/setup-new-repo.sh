#!/bin/bash



if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [path/to/new/repo/"
    exit 1
fi

echo "This script assumes that $1 is a public repo, cloned from GitHub"

cd $1 
ABS_PATH=`pwd`
git checkout -b new-repo-setup
mkdir -p hooks
cd -

cp files/* $ABS_PATH/.
cp scripts/* $ABS_PATH/.
cp hooks/* $ABS_PATH/hooks/.

cd travis
./setup-travis.sh $ABS_PATH
cd -

cd $ABS_PATH
git add setup.sh
git add hooks/*
git add LICENSE
git add .travis.yml .travis.settings.xml
git commit -am "Setup script complete"
./setup.sh
cd -

echo "A commit has been made on your new repo, in the branch new-repo-setup. Check it before pushing to GitHub, and merging as a pull request".
