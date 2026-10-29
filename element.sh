#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
QUERY="SELECT elements.atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id)"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit 0
fi

if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT=$($PSQL "$QUERY WHERE atomic_number = $1")
else
  ELEMENT=$($PSQL "$QUERY WHERE symbol = '$1' OR name = '$1'")
fi

if [[ -z $ELEMENT ]]
then
  echo "I could not find that element in the database."
  exit 0
fi

echo "$ELEMENT" | while IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME MASS MELTING BOILING TYPE
do
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
done
