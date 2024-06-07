#!/bin/bash
wget https://neup.inl.gov/SiteAssets/FY2022_Documents/Nuclear%20Science%20%26%20Engineering%20Education%20Sourcebook%202022.pdf -O nuke-sourcebook.pdf

pdfgrep  -h 'Professor|\[[^ ][^ ]*@[^ ][^ ]*\]' "nuke-sourcebook.pdf"| grep -oh '^[-A-Za-z. ]*,\|\[[^ ][^ ]*@[^ ][^ ]*\]'> name-emails.txt
wc -l name-emails.txt
sed -i '.bak' 's/^\([^\[]\)/"\1/g' name-emails.txt
sed -i '.bak' 's/,$/"/g' name-emails.txt
sed -i '.bak' 's/"$/"/g' name-emails.txt
sed -i '.bak' 's/\[/</g' name-emails.txt
sed -i '.bak' 's/\]/>,/g' name-emails.txt
wc -l name-emails.txt


sed -i '.bak' '/Associate/d' name-emails.txt
sed -i '.bak' '/Engineering/d' name-emails.txt
sed -i '.bak' '/Provost/d' name-emails.txt
sed -i '.bak' '/Director/d' name-emails.txt
sed -i '.bak' '/radiation/d' name-emails.txt
sed -i '.bak' '/calibration/d' name-emails.txt
sed -i '.bak' '/Supervisor/d' name-emails.txt
sed -i '.bak' '/Hospital/d' name-emails.txt
sed -i '.bak' '/Technology/d' name-emails.txt
sed -i '.bak' '/Institute/d' name-emails.txt
sed -i '.bak' '/Medical/d' name-emails.txt
sed -i '.bak' '/President/d' name-emails.txt
sed -i '.bak' '/University/d' name-emails.txt
sed -i '.bak' '/Professor/d' name-emails.txt
sed -i '.bak' '/Program/d' name-emails.txt
sed -i '.bak' '/Department/d' name-emails.txt
sed -i '.bak' '/Jr\./d' name-emails.txt
sed -i '.bak' '/Sr\./d' name-emails.txt
sed -i '.bak' '/Adjunct/d' name-emails.txt
sed -i '.bak' '/Ph.D./d' name-emails.txt
perl -p0e 's/"\n</",</igs' name-emails.txt > name-emails-2.txt
mv name-emails-2.txt name-emails.txt
sed -i '.bak' '/</!d' name-emails.txt
sed -i '.bak' 's/^"//g' name-emails.txt
sed -i '.bak' 's/"/,,,,,,,,,,,,,,,,,,,,,,,,,,NESourcebook,Work/g' name-emails.txt
sed -i '.bak' 's/^</,,,,,,,,,,,,,,,,,,,,,,,,,,NESourcebook,Work,</g' name-emails.txt
sed -i '.bak' 's/$/,/g' name-emails.txt
sed -i '.bak' 's/<//g' name-emails.txt
sed -i '.bak' 's/>//g' name-emails.txt
cat google-header.csv name-emails.txt > name-emails.csv
