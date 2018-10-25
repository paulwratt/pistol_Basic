#!/bin/sh
if [ "$1" = "" -o "$1" = "--help" ]; then
  echo 'use with 'bas_data2array.sh'"
  exit 0
fi

for PART in LINE; do
  if [ i -eq 0 ]; then
    print "$PART "
  fi
  print "$2"
done
