#!/bin/sh

sudo gem uninstall cucumba
rake install_gem_no_doc

SAMPLE_APP_PATH=`dirname $0`/sample_app
echo "(in $SAMPLE_APP_PATH)"
cd $SAMPLE_APP_PATH
./script/generate cucumba -f test
rake db:reset
./script/cucumba
