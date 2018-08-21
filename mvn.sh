#!/usr/bin/env bash

mvn $@

cd annot8-parent
mvn $@ 

cd ../annot8-conventions
mvn $@

cd ../annot8-core
mvn $@

cd ../annot8-common
mvn $@

cd ../annot8-testing
mvn $@

cd ../annot8-default-impl
mvn $@

cd ../annot8-components
mvn $@

cd ..
