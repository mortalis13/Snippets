create table "CAT"
(
"ID" NUMBER(8,0) NOT NULL,
"COLOR" VARCHAR2(250 BYTE),
"OWNER_ID" NUMBER(8,0)
);

create table "OWNER"
(
"ID" NUMBER(8,0) NOT NULL,
"NAME" VARCHAR2(250 BYTE)
);

create table "HOME"
(
"ID" NUMBER(8,0) NOT NULL,
"DESC" VARCHAR2(250 BYTE)
);

insert into cat values(1, 'color-1', 1);
insert into cat values(2, 'color-2', 1);
insert into cat values(3, 'color-3', 1);
insert into cat values(4, 'color-4', 2);
insert into cat values(5, 'color-5', 2);

insert into owner values(1, 'owner-1');
insert into owner values(2, 'owner-2');
insert into owner values(3, 'owner-3');

insert into home values(1, 'home-1');
insert into home values(2, 'home-2');
insert into home values(3, 'home-3');

commit;
