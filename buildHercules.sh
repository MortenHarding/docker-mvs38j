#!/bin/bash
cd /app/hercules-helper
git pull
./hercules-buildall.sh --auto --macports --flavor=sdl-hyperion --no-bashrc --no-envscript --config=herc4.conf
zip -r herc4x.zip ./herc4x
$SHELL
