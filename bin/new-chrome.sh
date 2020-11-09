#!/bin/bash
set -e

if [ -n "$1" ]; then
  PROFILE_DIR="$1"
else
  PROFILE_DIR=$(mktemp -d -t chrome-XXXXXXXXXX)
fi

echo "Profile stored in $PROFILE_DIR. Run same chrome with new-chrome.sh \"$PROFILE_DIR\""
google-chrome --user-data-dir="$PROFILE_DIR"
