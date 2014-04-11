DIRECTORY=.
for i in $DIRECTORY/*.ps;
do
  filename=$(basename "$i")
  extension="${filename##*.}"
  filename="${filename%.*}"
  ps2epsi $filename.ps $filename.eps
done


