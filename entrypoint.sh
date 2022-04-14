#!/bin/sh
git config --global --add safe.directory /github/workspace
python /action/main.py "$@"
