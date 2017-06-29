
select * from all_users order by username;


-- sqlplus sys as sysdba;
-- (password empty)

create user prueba01 identified by prueba02;
grant all privileges to prueba01;

drop user prueba01;
drop user prueba01 cascade;
