#!/usr/bin/env bash


repos=( "annot8-common" "annot8-components" "annot8-conventions" "annot8-core" "annot8-default-impl" "annot8-parent" "annot8-testing" )

for r in "${repos[@]}"
do
	git clone git@github.com:annot8/$r.git $r
	cd $r
	./setup.sh
	cd -
done



