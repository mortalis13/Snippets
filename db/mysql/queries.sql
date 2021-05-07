-- demo DB
create database export_test;
use export_test;

create table employee(id int, name varchar(200), id_dept int);
create table department(id int, name varchar(200));
  
insert into employee values(1,'emp1',2);
insert into employee values(2,'emp2',1);
insert into employee values(3,'emp3',2);
insert into employee values(4,'emp4',3);
insert into employee values(5,'emp5',4);
  
insert into department values(1,'dep1');
insert into department values(2,'dep2');
insert into department values(3,'dep3');
insert into department values(4,'dep4');


-- search films in the DB using the searchterm from the input form
SELECT * FROM `sdvd_products` WHERE (`title` LIKE '%terminator%' AND `title` LIKE '%II%') OR (`country` LIKE '%spain%' AND `country` LIKE '%germany%')


-- select multiple tables
select t1.*, t2.*, t3.* from t1 inner join t2 on t1.id=t2.t1_id inner join t3 on t3.id=t2.t3_id;


-- extract date part from a datetime column
select date(cdate) from log order by id_log desc;
select * from log where date(cdate)='2025-02-08';
