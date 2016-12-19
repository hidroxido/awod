#! /bin/bash

#CAMBIAR PATH PARA UBICACION DE IMAGEN DE FONDO
ubicacion=/home/usuario/wallpaper

wget -q http://apod.nasa.gov -P $ubicacion
nasa=$(grep "<IMG" $ubicacion/index.html | cut -d \" -f 2 )
apod="http://apod.nasa.gov/apod/"$nasa
echo $apod
image=$(echo $nasa | cut -d "/" -f 3)
fecha=$(date)
echo "" >> $ubicacion/apod.log
echo "========= $fecha ==========" >> $ubicacion/apod.log
wget -nv $apod -P $ubicacion >> $ubicacion/apod.log 2>&1
rm $ubicacion/index.html

#COMPROBAR SI EXISTE DIRECTORIO apod/ PARA GUARDAR IMAGNES ORGINALES
if [ -d $ubicacion/apod/ ];
  then
    cp $ubicacion/$image $ubicacion/apod/
  else
    mkdir $ubicacion/apod/
    cp $ubicacion/$image $ubicacion/apod/
fi

#LA IMAGEN QUE SE OCUPARA DE FONDO SE LLAMARA bg.jpg
mv $ubicacion/$image $ubicacion/bg.jpg

#IMPORTANTE !!!! CAMBIAR SEGUN ESCITORIO O DESKTOP MANAGER QUE SE UTILICE !!!
DISPLAY=:0.0 fbsetbg -c $ubicacion/bg.jpg #METODO PARA CAMBIAR FONDO EN FLUXBOX

