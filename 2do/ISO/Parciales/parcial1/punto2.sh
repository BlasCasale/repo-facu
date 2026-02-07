#!/bin/bash

# Realice un script en bash que reciba una cantidad arbitraria de argumentos, de los cuales agregará a un arreglo
# solo aquellos que sean números. Una vez armado el arreglo, deberá imprimir la sumatoria de todos los números 
# que éste contenga. Para realizar esto, tiene a su disposición una función llamada is_number definida en el archivo 
# /usr/lib/functions.sh, el cual deberá importar de manera adecuada en su script. La función recibe un argumento y 
# retorna 0 si el argumento es un número y 1 en caso contrario.
# En su script deberá implementar, al menos, y utilizar las siguientes funciones (no se debe acceder directamente 
# al arreglo fuera de estas funciones):
# init: Inicializa el arreglo de números vacíos.
# add_number: agrega un número, recibido como argumento, al arreglo.
# all_numbers: retorna todos los números que contiene el arreglo.
# sum: retorna la sumatoria de todos los números que el arreglo contiene.
# ** Adicionalmente, el script deberá imprimir en el archivo "sums.log" (ubicado en el directorio adecuado acorde a FHS)
# una línea (sin borrar las anteriores) con: la fecha actual, la lista completa de elementos que se sumaron, y la suma 
# total de los números.
# Tanto el script como las funciones que implemente deberán realizar las validaciones necesarias 
# para su correcto funcionamiento.
source /usr/lib/functions.sh

numeros=()

init(){
  numeros=()
}

add_number(){
  is_number "$1"
  if [ $? -eq 0 ]; then
    numeros+=("$1")
  fi
}

all_numbers(){
  echo ${numeros[*]}
}

sum(){
  local total=0
  for num in ${numeros[*]}; do
    total=$((total + num))
  done
  echo "$total"
}

for arg in "$@"; do
  add_number "$arg"
done

fecha=date
lista=all_numbers
total=sum

echo "$fecha, [Lista]: $lista , sumatoria $total" >> /var/log/sums.log