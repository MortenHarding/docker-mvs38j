#!/bin/bash
cd /app/hercules-helper
git pull
cd /app/hercules
/app/hercules-helper//hercules-buildall.sh --auto --flavor=sdl-hyperion --config=/app/herc4.conf
. /herc4x/hyperion-init-bash.sh
cd /app
rm -rf hercules-helper
cd hercules
zip -r /app/herc4x.zip herc4x
$SHELL
