#!/bin/bash

read -p "a) Listar archivos
b) Donde estas trabajando 
c) Quien esta trabajando
Selección: " option

while [[ "$option" != "a" && "$option" != "b" && "$option" != "c" ]]
do
    read -p "a) Listar archivos
b) Donde estas trabajando
c) Quien esta trabajando
Selecciona: " option
    
    case $option in
        a|b|c) break ;;
        *) echo "Opción inválida" ;;
    esac
done

case $option in
  "a")
    echo "lista de archivos $(ls)"
    ;;
  "b")
    echo "esta trabajando en el directorio $(pwd)"
    ;;
  "c")
    echo "esta trabajando el usuario $(whoami)"
    ;;
esac