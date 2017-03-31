
-- create test table

create table "TEST"
(
"ID" NUMBER(8,0) NOT NULL,
"VAL1" VARCHAR2(250 BYTE) NOT NULL,
"VAL2" VARCHAR2(250 BYTE) NOT NULL
);

insert into test values(1, 'val1-1', 'val2-1');
insert into test values(2, 'val1-2', 'val2-2');
insert into test values(3, 'val1-3', 'val2-3');
insert into test values(4, 'val1-4', 'val2-4');
insert into test values(5, 'val1-5', 'val2-5');

commit;


-- raw hex bytes

insert into estado values(999, UTL_I18N.RAW_TO_CHAR('f3'));
insert into estado values(998, UTL_I18N.RAW_TO_CHAR('c3b3'));


-- diasble/enable a constraint

ALTER TABLE TABLE_NAME MODIFY CONSTRAINT FK_TABLE1_TABLE2 DISABLE;
ALTER TABLE TABLE_NAME MODIFY CONSTRAINT FK_TABLE1_TABLE2 ENABLE;


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
