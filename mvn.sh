#!/usr/bin/env bash

cd parent
mvn $@ 

cd ../conventions
mvn $@

cd ../core
mvn $@

cd ../common
mvn $@

cd ../testing
mvn $@

cd ../default-impl
mvn $@

cd ../components
mvn $@

cd ..