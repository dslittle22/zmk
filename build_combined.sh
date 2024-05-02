#!/usr/bin/bash
set -euo pipefail

if [[ $(pwd) = "/workspaces/zmk" ]]; then
    cd app
fi

west build -p -d build/left -b glove80_lh & \
    west build -p -d build/right -b glove80_rh & \
    wait;

mkdir -p build/combined && \
    cat /workspaces/zmk/app/build/left/zephyr/zmk.uf2 /workspaces/zmk/app/build/right/zephyr/zmk.uf2 > /workspaces/zmk/app/build/combined/zmk.uf2
