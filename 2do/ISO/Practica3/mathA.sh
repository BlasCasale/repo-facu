#!/bin/bash
# operaciones matematicas

read -p "Introduzca dos números" n1 n2
echo "La suma de $n1 y $n2 es $(($n1 + $n2))"
echo "La resta de $n1 y $n2 es $(($n1 - $n2))"
echo "La multiplicación de $n1 y $n2 es $(($n1 * $n2))"
echo "La división de $n1 y $n2 es $(($n1 / $n2))"

if [ $n1 -ge $n2 ]; then
  echo "El número mas grande es $n1"
else
  echo "El numero mas grande es $n2"
fi