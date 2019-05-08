mkdir -p figures
find figures-bin/* -iname "*.svg" | while read line ; do
NF="$(echo $line | sed -r "s/\.svg/\.pdf/"|sed -r "s|figures-bin/|figures/|")"
rsvg-convert -f pdf -o "$NF" "$line";
done
