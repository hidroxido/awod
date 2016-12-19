# Astronomy Wallapaper of the Day
Script en Bash que descarga la imagen astronomica del dia de APOD (apod.nasa.gov) y actualiza el fondo de escritorio (definido por el usuario) y se hara una copia original de la imagen en una carpeta llamada apod/ en la misma carpeta que contiene la imagen de fondo de escritorio (carpeta definida por el usuario tambien), ademas deja un archivo de texto que se llama apod.log el cual guarda un registro de la imagen descargada, util cuando se coloca el script en un cron y se necesite un registro.

A diferencia de otros script similares (hay bastantes) este es sencillo, de pocas lineas y facil de entender.

Por defecto el script actualiza el fondo de escritorio para el entorno Fluxbox, para otros entornos como Gnome o KDE se tiene que cambiar la linea correspondiente por el comando segun su WM o Desktopr

Favor leer los comentarios del script y hacer los cambios !!!

Se recomienda crear una regla de cron para la automatizacion del script segun la hora en que actualize APOD su imagen diariamente.

Las imagenes tienen copyright de sus respectivos creadores.
APOD apod.nasa.gov Copyright (C) NASA, Robert Nemiroff (MTU) & Jerry Bonnell (UMCP)
