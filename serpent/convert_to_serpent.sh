#!/bin/bash
echo path to files is $1

FILES=$1/*.xsdir
for file in $FILES
do 
  filename=$(basename "$file")
  extension="${filename##*.}"
  filename="${filename%.*}"
  newname=$filename.xsdata
  ./xsdirconvert.pl $1/data.xsdir >> $1/$newname
  echo file converted to $1/$newname
done
