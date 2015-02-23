#!/bin/bash
OLD="VnV"
NEW="QA"
DPATH="/Users/khuff/repos/pyne/tutorial/*"
BPATH="/Users/khuff/repos/backup"
TFILE="/tmp/out.tmp.$$"

[ ! -d $BPATH ] && mkdir -p $BPATH || :
for f in $DPATH
do
  if [ -f $f -a -r $f ]; then
    /bin/cp -f $f $BPATH
   sed "s/$OLD/$NEW/g" "$f" > $TFILE && mv $TFILE "$f"
  else
   echo "Error: Cannot read $f"
  fi
done
/bin/rm $TFILE
