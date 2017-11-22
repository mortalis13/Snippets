SELECT * FROM NLS_DATABASE_PARAMETERS;
SELECT * FROM NLS_DATABASE_PARAMETERS where PARAMETER='NLS_CHARACTERSET';
SELECT value FROM NLS_DATABASE_PARAMETERS where PARAMETER='NLS_RDBMS_VERSION';

select * from database_properties;
select * from database_properties where property_name like '%CHAR%';
