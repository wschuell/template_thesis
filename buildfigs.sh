mkdir -p figures
find figures-bin/* -iname "*.svg" | while read line ; do
NF0="$(echo $line |sed -r "s|figures-bin/|figures/|")"
NF="$(echo $line | sed -r "s/\.svg/\.pdf/"|sed -r "s|figures-bin/|figures/|")"
NF2="$(echo $line | sed -r "s/\.svg/\.png/"|sed -r "s|figures-bin/|figures/|")"
#rsvg-convert -f pdf -o "$NF" "$line";
# sed 's/opacity:0\.\([0-9]*\)\(;fill[^ ]*fill-opacity:\)1/opacity:1\20\.\1/' input_with_opacity.svg > output_with_alpha.svg


# cat $line | sed -r "s/\stroke-width:0;/\stroke-width:1px;/g" > $NF0
# inkscape -z "$NF0" --export-pdf="$NF"
# rm $NF0

inkscape -z $line --export-pdf="$NF"
ps2pdf $NF "$NF"_temp && mv "$NF"_temp $NF
#inkscape -z $line -e $NF2 -d 1000
#svgexport $line $NF png 100%
done

find figures-bin/* -iname "*.png" | while read line ; do
NF="$(echo $line |sed -r "s|figures-bin/|figures/|")"
cp "$line" "$NF";
done

find figures-bin/* -iname "*.pdf" | while read line ; do
NF="$(echo $line |sed -r "s|figures-bin/|figures/|")"
cp "$line" "$NF";
done

find figures-bin/* -iname "*.jpg" | while read line ; do
NF="$(echo $line |sed -r "s|figures-bin/|figures/|")"
cp "$line" "$NF";
done
