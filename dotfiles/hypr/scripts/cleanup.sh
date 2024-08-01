#!/usr/bin/env sh

# Remove gamemode flag
if [ -f ~/.cache/gamemode ] ;then
    rm ~/.cache/gamemode
    echo ":: ~/.cache/gamemode removed"
fi
