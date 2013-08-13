#!/bin/bash
echo path to pdf files is $1

FILES=$1/*.pdf
for file in $FILES
do
  pdfcrop $file $file
  pdftops -eps $file
done
