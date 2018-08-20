#!/usr/bin/env bash

cd annot8-parent
git $@ 

cd ../annot8-conventions
git $@

cd ../annot8-core
git $@

cd ../annot8-common
git $@

cd ../annot8-testing
git $@

cd ../annot8-default-impl
git $@

cd ../annot8-components
git $@

cd ..
