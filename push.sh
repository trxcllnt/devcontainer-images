#!/usr/bin/env bash

find src -mindepth 1 -maxdepth 1 -type d | sort -h | xargs -t -L1 -n1 -P$(nproc --ignore=2) \
    sh -c "docker push ghcr.io/trxcllnt/devcontainer-images/\${0#src/}:latest"
