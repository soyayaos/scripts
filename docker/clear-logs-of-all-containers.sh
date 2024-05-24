#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "This script must be run with sudo" >&2
  exit 1
fi

containers=$(docker ps -aq)

for container in $containers
do
  log_file=$(docker inspect --format='{{.LogPath}}' $container)

  if [ -f "$log_file" ]; then
    sudo truncate -s 0 "$log_file"
  fi
done
