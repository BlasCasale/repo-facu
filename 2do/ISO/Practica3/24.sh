#!/bin/bash
usersVec=()

function print() {
  for user in "${usersVec[@]}"; do
    echo "$user"
  done
}

function getUsers() {

  local str="$(getent group users | cut -d: -f4)"

  for user in $(echo "$str" | tr ',' ' '); do
    usersVec+=("$user")
  done
}

getUsers

if [ $# -eq 1 ]; then
  if [ "$1" = "-l" ]; then
    echo "hay ${#usersVec[@]} en el grupo"
    exit 0
  fi

  if [ "$1" = "-i" ]; then
    print
    exit 0
  fi
fi

if [ $# -eq 2 -a "$1" = "-b" ]; then
  if [ "${usersVec[$2]}" ]; then
    echo "${usersVec[$2]}"
    exit 0
  else
    echo "posicion no valida"
    exit 1
  fi
fi

exit 1