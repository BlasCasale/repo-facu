#!/bin/bash

while true; do

  echo "Menú de opciones
  00) Salir
  03) Ejercicio 3
  12) Evaluar expresiones
  13) Buscar archivo
  14) Cambiar nombre
  16) Contar archivos por extensión de un usuario dado
  17) Cambiar minúsculas por mayúsculas
  18) Controlar si un usuario se ha logueado
  Opción seleccionada:" 
  
  read option

  case $option in
    "00")
      exit 0
      ;;
    "03")
      ./mostrar.sh
      ;;
    "12")
      read -p "se debe enviar en este orden (operación a ejecutar, número1, número2)" op n1 n2
      ./mathC.sh "$op" "$n1" "$n2"
      ;;
    "13")
      read -p "se debe enviar el nombre del archivo/directorio a buscar o por defecto se creará un directorio" name
      ./13c.sh "$name"
      ;;
    "14")
      read -p "se debe enviar laRuta opción (-a o -b) y nombreACambiar" route op name
      ./14.sh "$route" "$op" "$name"
      ;;
    "16")
      read -p "se debe enviar la extensión a buscar" ext
      ./16.sh "$ext"
      ;;
    "17")
      read -p "se debe enviar la ruta para cambiar las minúsculas por mayúsculas y viceversa, eliminando A y a también" route
      ./17.sh "$route"
      ;;
    "18")
      read -p "se debe enviar el nombre del usuario a verificar si esta logueado en el sistema" user
      ./18.sh "$user"
      ;;
    *)
      echo "opción inválida"
      ;;
  esac
done