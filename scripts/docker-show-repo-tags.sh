#!/bin/sh
#
# Simple script that will display docker repository tags.
#
# Usage:
#   $ docker-show-repo-tags.sh ubuntu centos
for REPO in $* ; do
    curl -s -S "https://registry.hub.docker.com/v2/repositories/$REPO/tags/" | jq --arg REPO "$REPO" '."results"[] |= .+ {"repo":$REPO} | ."results"[] | .repo + ":" + .name'
done
