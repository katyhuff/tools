DIRECTORY=.
for i in $DIRECTORY/*.png;
do
  filename=$(basename "$i")
  extension="${filename##*.}"
  filename="${filename%.*}"
  convert $filename.png $filename.jpg
done


