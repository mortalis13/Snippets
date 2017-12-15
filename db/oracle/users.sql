
select * from all_users order by username;


-- sqlplus sys as sysdba;
-- (password empty)

create user prueba01 identified by prueba02;
grant all privileges to prueba01;

drop user prueba01;
drop user prueba01 cascade;


alter user myuser identified by mynewpassword account unlock;



ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;

---

SELECT 'alter user "'||d.username||'" identified by values '''||u.password||''';' c FROM dba_users d, sys.user$ u WHERE d.username = upper('bdnsboc') AND u.user# = d.user_id;

ALTER USER "BDNSBOC" identified by VALUES 'C4A17BA12F42916B';

---

spool myoutputfile.txt
select * from sys.user$;
spool off;


