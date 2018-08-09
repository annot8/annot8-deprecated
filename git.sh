#!/usr/bin/env bash

cd parent
git $@ 

cd ../conventions
git $@

cd ../core
git $@

cd ../common
git $@

cd ../testing
git $@

cd ../default-impl
git $@

cd ../components
git $@

cd ..
