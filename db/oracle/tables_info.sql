
# -------------------------
ALL_OBJECTS
ALL_TAB_COLUMNS
ALL_SYNONYMS
ALL_CONS_COLUMNS
USER_TAB_COLUMNS
USER_TABLES
USER_CONSTRAINTS
USER_OBJECTS
USER_CONS_COLUMNS
USER_SEQUENCES
# -------------------------

# -------------------------
SELECT * FROM ALL_OBJECTS;
SELECT * FROM ALL_TAB_COLUMNS;
SELECT * FROM ALL_SYNONYMS;
SELECT * FROM ALL_CONS_COLUMNS;
SELECT * FROM USER_TAB_COLUMNS;
SELECT * FROM USER_TABLES;
SELECT * FROM USER_CONSTRAINTS;
SELECT * FROM USER_OBJECTS;
SELECT * FROM USER_CONS_COLUMNS;
# -------------------------


DESC rol;
DESCRIBE rol;

select * from all_objects where owner='owner';

SELECT table_name FROM user_tables;

SELECT * FROM USER_TAB_COLUMNS;

SELECT * FROM USER_TAB_COLUMNS where table_name in (select table_name from user_tables);

-- !
SELECT table_name, column_name, data_type, data_length, data_precision, nullable FROM USER_TAB_COLUMNS where table_name in (select table_name from user_tables);

SELECT table_name, column_name, data_type, CASE WHEN data_precision is NULL THEN data_length ELSE data_precision END "LENGTH", nullable FROM USER_TAB_COLUMNS where table_name in (select table_name from user_tables);

SELECT column_name, CASE WHEN data_precision is NULL THEN data_length ELSE data_precision END "LENGTH" FROM USER_TAB_COLUMNS where table_name='TABLE';

SELECT table_name, column_name, data_type, CASE WHEN data_precision is NULL THEN data_length ELSE data_precision END "LENGTH", nullable
FROM USER_TAB_COLUMNS
ORDER BY table_name, column_name;


-- get info for synonym

SELECT als.SYNONYM_NAME, atc.TABLE_NAME, atc.COLUMN_NAME
FROM ALL_TAB_COLUMNS atc
JOIN ALL_SYNONYMS als ON atc.table_name = als.table_name
WHERE als.OWNER='owner'
ORDER BY als.SYNONYM_NAME


-- get primary keys columns

SELECT * FROM USER_CONS_COLUMNS WHERE CONSTRAINT_NAME IN (
  SELECT CONSTRAINT_NAME FROM USER_CONSTRAINTS WHERE CONSTRAINT_TYPE='P'
)
ORDER BY TABLE_NAME, COLUMN_NAME


-- get foreign keys and their columns relations (1-2)

SELECT A.TABLE_NAME TABLE_NAME_1, A.COLUMN_NAME COLUMN_NAME_1, C.TABLE_NAME TABLE_NAME_2, C.COLUMN_NAME COLUMN_NAME_2, A.CONSTRAINT_NAME, B.R_CONSTRAINT_NAME
FROM USER_CONS_COLUMNS A,
(
  SELECT CONSTRAINT_NAME, R_CONSTRAINT_NAME FROM USER_CONSTRAINTS
  WHERE CONSTRAINT_TYPE='R'
) B,
(
  SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME FROM USER_CONS_COLUMNS
  WHERE CONSTRAINT_NAME IN (
    SELECT R_CONSTRAINT_NAME FROM USER_CONSTRAINTS
    WHERE CONSTRAINT_TYPE='R'
  )
) C
WHERE A.CONSTRAINT_NAME=B.CONSTRAINT_NAME
AND B.R_CONSTRAINT_NAME=C.CONSTRAINT_NAME
ORDER BY A.TABLE_NAME, A.COLUMN_NAME
