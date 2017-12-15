
DESCRIBE rol;

SELECT table_name FROM user_tables;

SELECT * FROM USER_TAB_COLUMNS;

SELECT * FROM USER_TAB_COLUMNS where table_name in (select table_name from user_tables);

-- !
SELECT table_name, column_name, data_type, data_length, data_precision, nullable FROM USER_TAB_COLUMNS where table_name in (select table_name from user_tables);

SELECT table_name, column_name, data_type, CASE WHEN data_precision is NULL THEN data_length ELSE data_precision END "LENGTH", nullable FROM USER_TAB_COLUMNS where table_name in (select table_name from user_tables);

SELECT column_name, CASE WHEN data_precision is NULL THEN data_length ELSE data_precision END "LENGTH" FROM USER_TAB_COLUMNS where table_name='ACTA';


-- get info for synonym

SELECT COLUMN_NAME
FROM ALL_TAB_COLUMNS atc
JOIN ALL_SYNONYMS als ON atc.table_name = als.table_name
WHERE als.SYNONYM_NAME='my_synonym'
  AND als.OWNER IN (USER, 'PUBLIC')
  AND atc.COLUMN_NAME LIKE ('GLOBE_%')
ORDER BY atc.COLUMN_ID
