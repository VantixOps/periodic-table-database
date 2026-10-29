#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  $PSQL "SELECT atomic_number, symbol, name, weight FROM elements JOIN properties USING(atomic_number) WHERE name = '$1'"
fi
