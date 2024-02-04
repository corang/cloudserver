#!/bin/bash

set -e

echo Testing if sed replace works

sed 's/const enableRemoteManagement = true;/const enableRemoteManagement = false;/g' upstream/lib/server.js | grep -q 'enableRemoteManagement = false'

echo "Success, executing replace"

sed -i 's/const enableRemoteManagement = true;/const enableRemoteManagement = false;/g' upstream/lib/server.js

echo "Verifying replace"

cat upstream/lib/server.js | grep -q 'enableRemoteManagement = false'

echo "Verified"