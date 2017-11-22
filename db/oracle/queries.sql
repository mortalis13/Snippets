
-- create test table

create table "TEST"
(
"ID" NUMBER(8,0) NOT NULL,
"VAL1" VARCHAR2(250 BYTE),
"VAL2" VARCHAR2(250 BYTE)
);

insert into TEST values(1, 'val1-1', 'val2-1');
insert into TEST values(2, 'val1-2', 'val2-2');
insert into TEST values(3, 'val1-3', 'val2-3');
insert into TEST values(4, 'val1-4', 'val2-4');
insert into TEST values(5, 'val1-5', 'val2-5');

commit;


-- raw hex bytes

insert into estado values(999, UTL_I18N.RAW_TO_CHAR('f3'));
insert into estado values(998, UTL_I18N.RAW_TO_CHAR('c3b3'));


-- diasble/enable a constraint

ALTER TABLE TABLE_NAME MODIFY CONSTRAINT FK_TABLE1_TABLE2 DISABLE;
ALTER TABLE TABLE_NAME MODIFY CONSTRAINT FK_TABLE1_TABLE2 ENABLE;

SELECT * FROM user_constraints;
SELECT * FROM user_constraints WHERE CONSTRAINT_TYPE='R';     -- foreign keys


SELECT
  'ALTER TABLE ' || owner || '.' || table_name || 
  ' DISABLE CONSTRAINT ' || constraint_name || ';'
FROM
  user_constraints
WHERE 
  CONSTRAINT_TYPE='R';


SELECT
  'ALTER TABLE ' || owner || '.' || table_name || 
  ' ENABLE CONSTRAINT ' || constraint_name || ';'
FROM
  user_constraints
WHERE 
  CONSTRAINT_TYPE='R';
  

SELECT * FROM USER_CONSTRAINTS
WHERE CONSTRAINT_TYPE='R'
AND R_CONSTRAINT_NAME='EXEF_PK';


-- remove all objects in schema

select 'drop '||object_type||' '|| object_name|| DECODE(OBJECT_TYPE,'TABLE',' CASCADE CONSTRAINTS','') || ';'  from user_objects;


-- date format

select id,TO_CHAR(datecol, 'YYYY-MM-DD HH24:MI:SS') from audit order by id desc;


-- misc

ALTER TABLE DOCUMENT ADD (COLUMN1 VARCHAR2(20));
ALTER TABLE DOCUMENT MODIFY (COLUMN1 NUMBER(3));
ALTER TABLE DOCUMENT DROP COLUMN COLUMN1;
ALTER TABLE DOCUMENT DROP (COLUMN1);
ALTER TABLE DOCUMENT RENAME COLUMN NAME1 TO NAME2;
ALTER TABLE "TABLE_NAME" ADD CONSTRAINT "FK_NAME" FOREIGN KEY ("ID_TABLE1") REFERENCES "TABLE2"("ID_TABLE2") ENABLE;
ALTER TABLE TABLE_NAME ADD CONSTRAINT CHK_NAME CHECK (DOC_TYPE < 5) ENABLE;


-- MD5

-- in SYS user
grant execute on DBMS_CRYPTO to TEMP_LOC;
-- in a schema
select DBMS_CRYPTO.HASH (rawtohex('123'), 2) from dual;
select DBMS_CRYPTO.Hash (UTL_I18N.STRING_TO_RAW ('123', 'AL32UTF8'), 2) from dual;

-- Oracle 12c
select standard_hash('123', 'MD5') from dual;


-- random

select round(dbms_random.value() * 2) + 1 from dual;


-- regexp

SELECT REGEXP_SUBSTR ('text', 'EC\d+') FROM dual;


PROMPT SOME_TEXT;
