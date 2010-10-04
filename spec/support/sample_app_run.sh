#!/bin/sh

sudo gem uninstall cucumba
sudo rake install

SAMPLE_APP_PATH=`dirname $0`/sample_app
echo "(in $SAMPLE_APP_PATH)"
cd $SAMPLE_APP_PATH
./script/generate cucumba -f test
rake db:setup RAILS_ENV=test
./script/cucumba
