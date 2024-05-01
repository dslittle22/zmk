#!/usr/bin/bash
set -euo pipefail

if [[ $(pwd) = "/workspaces/zmk" ]]; then
    cd app
fi



west build -p -d build/left -b glove80_lh & \
    west build -p -d build/right -b glove80_rh & \
    wait;

mkdir -p build/combined && \
    cat build/left/zephyr/zmk.uf2 build/right/zephyr/zmk.uf2 > build/combined/glove80.uf2
