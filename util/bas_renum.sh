#!/bin/sh
if [ "$1" = "" ]; then
  echo "renumber a .bas file"
  echo "uses 'sed' on stream. edit me first."
  echo "usage: ./bas_renum.sh <file.bas>"
  exit 0
fi

if [ ! -f "$1" ]; then
  echo "file not found: '$1'"
fi

# move lines 5???? to 15????
cat "$1" | sed 's/\(^5[0-9]\{4\}\ \)\(.*\)/1\1\2/g'

# replace 5????, with 15????,
#cat "$1" | sed 's/\(5[0-9]\{4\},\)/1\1/g'

