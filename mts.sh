#!/bin/sh
#
# This command file launches the MTS.
# Ensure that the Hercules executable (hercules) is in your path.
#
# Changed to avoid routine to kill 3270 emulators.
#

rsync -a -r --ignore-existing ./backup/* /app/mvs

export configfile="./conf/hercules-mts.conf"
export logfile="./log/log.txt"

if [ -r ${logfile} ]; then
   rm -rf ${logfile}
fi
if [ -r ${configfile} ]; then
   PORT=`cat ${configfile} | grep CNSLPORT | awk '{print $2}'`
   export SLASH=/
   x3270 -model 5 -once 127.0.0.1:${PORT}&
   x3270 -model 5 -once 127.0.0.1:${PORT}&
   hercules -f ${configfile} > ${logfile}
fi

# eof
