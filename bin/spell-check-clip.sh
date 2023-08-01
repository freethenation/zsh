#!/bin/bash
set -e
set -o pipefail
if [ -n "$DO_SPELLING" ]; then
    TMP=$(mktemp)
    cleanup() {
    rm -f "$TMP"
    }
    trap cleanup EXIT
    xclip -o -selection primary > "$TMP"
    aspell --dont-backup -c "$TMP"
    OUT=$(cat "$TMP")
    nohup bash -c "sleep 0.5; xdotool type $OUT" &
else
    SCRIPT=$(realpath -s "$0")
    CMD="env DO_SPELLING=1 $SCRIPT"
    xfce4-terminal -e "$CMD" #-H
fi
