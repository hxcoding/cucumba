#!/bin/sh

./script/generate cucumba -f test
rake cucumba:servers:run
