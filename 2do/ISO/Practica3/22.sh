#!/bin/bash

numbers=(10 2 3 5 4 1 15 8 9 6 12 7 11 14 13 16 2 10 4 19 18 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1)

counter=0
for number in "${numbers[@]:1}"; do
  if [ $((number % 2)) -eq 0 ]; then
    echo $number
  else
    counter="$(($counter + 1))"
  fi
done

echo "se contaron $counter numeros impares"