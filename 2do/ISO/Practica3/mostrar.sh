#!/bin/bash  
# Comentarios acerca de lo que hace el script  
# Siempre comento mis scripts, si no lo hago hoy, 
# mañana ya no me acuerdo de lo que quise hacer  
echo "Introduzca su nombre y apellido:"  
read nombre apellido  
echo "Fecha y hora actual:"  
date  
echo "Su apellido y nombre es:"
echo "$apellido $nombre"
echo "Su usuario es `whoami`"
echo "su directorio actual es `pwd`"
echo "los archivos de este directorio son " $(ls)
echo "el directorio personal es $HOME"
echo "espacio libre en disco"
df -h