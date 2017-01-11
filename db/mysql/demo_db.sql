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
