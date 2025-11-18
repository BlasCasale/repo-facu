#!/bin/bash

num=(10 3 8 9 15 2 1 5 6 8)
# num=(10 2)

result="${num[0]}"

echo "imprimiendo primer valor $result"

for number in "${num[@]:1}"; do
  echo "imprimiendo el numero $number"
  result=$((result * number))
done

echo "$result"