#!/bin/bash

set -e
eval "$(chef shell-init sh)"
export BERKSHELF_API_PATH='/opt/berkshelf-api'

if [ ! -f "$BERKSHELF_API_PATH/config.json" ]; then
  echo "Missing the config.json file. Did you create one in the directory of your Dockerfile?"
  exit 1;
fi

if [ "x$1" != "x" ]; then
 exec berks-api $1
fi
