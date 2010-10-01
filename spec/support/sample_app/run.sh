#!/bin/sh

rm -r vendor
mkdir -p vendor/gems
ln -sf $PWD/../../../../cucumba/ vendor/gems/cucumba-0.0.0
./script/generate cucumba -f test
rake db:reset
./script/cucumba
