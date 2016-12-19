#! /bin/bash
#AWOD Copyright (C) 2016 Camilo Ortiz
#apod.nasa.gov Copyright (C) NASA and  Robert Nemiroff (MTU) & Jerry Bonnell (UMCP)
#Pictures Copyright (C) belong to their respective owners

#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>
#===============================================================

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

