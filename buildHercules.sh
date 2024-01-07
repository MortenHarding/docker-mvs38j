#!/bin/bash
cd /app/hercules-helper
git pull
cd /app/hercules
/app/hercules-helper//hercules-buildall.sh --auto --flavor=sdl-hyperion --config=/app/herc4.conf
. /herc4x/hyperion-init-bash.sh
cd /app
rm -rf hercules-helper
zip -r hercules.zip ./hercules
$SHELL
