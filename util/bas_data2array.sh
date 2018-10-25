#!/bin/sh
if [ "$1" = "" -o "$2" = "" -o "$1" = "--help" ]; then
  echo 'basic DATA lines to "string" arrays, keep same line number'
  echo "usage: bas_data2array.sh <file> <array> "
  echo "   eg: bas_data2array.sh data.bas 'test$(##,#)'"
  echo "   eg: bas_data2array.sh data.bas 'test$(i,#)'"
  echo "   eg: bas_data2array.sh data.bas 'test$(#)'"
  exit 0
fi
if [ ! -f "$1" ]; then
  echo "not found: '$1'"
  exit 1
fi
#tail -n 9 "$1" | grep data | sed 's/ rem / /g' | sed 's/ data / ,/g' | sed \tst,t" : `echo $2`="tg' | sed 's/""/"/g' | sed 's/ " : / /g'
cat "$1" | grep data | sed 's/ rem / /g' | sed 's/ data / ,/g' | sed \tst,t" : `echo $2`="tg' | sed 's/""/"/g' | sed 's/ " : / /g'
 