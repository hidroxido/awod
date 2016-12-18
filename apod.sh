#! /bin/bash

wget -q http://apod.nasa.gov -P /home/saruman/wallpaper
nasa=$(grep "<IMG" /home/saruman/wallpaper/index.html | cut -d \" -f 2 )
apod="http://apod.nasa.gov/apod/"$nasa
echo $apod
image=$(echo $nasa | cut -d "/" -f 3)
fecha=$(date)
echo "" >> apod.log
echo "========= $fecha ==========" >> apod.log
wget -nv $apod -P /home/saruman/wallpaper >> apod.log 2>&1
rm /home/saruman/wallpaper/index.html
cp /home/saruman/wallpaper/$image /home/saruman/wallpaper/apod/
mv /home/saruman/wallpaper/$image /home/saruman/wallpaper/bg.jpg
DISPLAY=:0.0 fbsetbg -c /home/saruman/wallpaper/bg.jpg

