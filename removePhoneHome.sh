#!/bin/bash

set -e

SEARCH_TEXT='const enableRemoteManagement = true;'
REPLACE_TEXT='const enableRemoteManagement = false;'

APACHE_NOTICE='\/\/ Below line modified by @corang, upstream is true'


echo Testing if sed replace works

sed "s|$SEARCH_TEXT|${APACHE_NOTICE}\n${REPLACE_TEXT}|g" upstream/lib/server.js | grep -q "${REPLACE_TEXT}"

echo "Success, executing replace"

sed -i "s|$SEARCH_TEXT|${APACHE_NOTICE}\n${REPLACE_TEXT}|g" upstream/lib/server.js

echo "Verifying replace and notice"

cat upstream/lib/server.js | grep -q "${REPLACE_TEXT}"

cat upstream/lib/server.js | grep -q "${APACHE_NOTICE}"

echo "Verified"