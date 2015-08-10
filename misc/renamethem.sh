for file in *.mp3; do
    mv "${file}" "${file/_\[plixid.com\]/}"
done
