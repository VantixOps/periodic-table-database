# Periodic Table Database

freeCodeCamp Relational Databases — Periodic Table project.

## Files

- `periodic_table.sql` — complete database dump (schema, constraints, data).
- `element.sh` — prints an element by atomic number, symbol or name.

## Restore and use

```bash
psql -U postgres < periodic_table.sql
./element.sh 1
./element.sh H
./element.sh Hydrogen
./element.sh moTium
```

## Database changes in this project

`atomic_mass` replaces `weight`, the melting and boiling points are stored in
celsius and are `NOT NULL`, symbol and name are unique and `NOT NULL`,
`properties` references `elements` and `types`, symbols are capitalized,
masses have no trailing zeros, fluorine and neon are included and the
placeholder element 1000 (`moTanium`) and the old free-text `type` column are gone.
