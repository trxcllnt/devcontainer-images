#!/usr/bin/env bash

find src -mindepth 1 -maxdepth 1 -type d | sort -h | xargs -t -L1 -n1 -P$(nproc --ignore=2) \
    sh -c "npx -y --package=@devcontainers/cli -c \"\
        devcontainer build \
            --log-level info \
            --workspace-folder \$0 \
            --image-name ghcr.io/trxcllnt/devcontainer-images/\${0#src/}:latest \
            $@\""
