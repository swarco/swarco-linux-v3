#!/bin/sh

# Prepare global environment variables for all process
# (getty terminal login and processes started by /etc/init.d/S??*)

for dir in /usr/swarco/bin
do
  if [ -d $dir ]; then
      PATH=$PATH:$dir
  fi
done

for dir in /usr/swarco/lib
do
  if [ -d $dir ]; then
      LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$dir
  fi
done

export PATH
export LD_LIBRARY_PATH

if [ -f /etc/TZ -a \! -f /etc/localtime ]; then
    export TZ=`cat /etc/TZ`
fi
