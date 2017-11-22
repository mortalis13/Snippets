
begin
  for x in (select * from table) loop
    dbms_output.put_line(x.name);
  end loop;
end;
/


declare
  var1 table.colm%type;
begin
  select name into var1 from table
  where id=1651;
  dbms_output.put_line(var1);
end;
/


declare
  TYPE StrList IS VARRAY(100) OF VARCHAR2(15);
  var1 varchar2(100);
  var2 StrList;
  i1 number(3);
begin
  var2 := StrList();
  var2.extend(10);
  var2(1) := 'v1';
  -- dbms_output.put_line(var2(1));
  i1 := var2.count;
  
  dbms_output.put_line('Total: ' || i1);
  for i in 1..i1 loop
    dbms_output.put_line(var2(i));
  end loop;
end;
/


BEGIN  
  FOR t IN (SELECT owner, table_name, column_name
            FROM all_tab_columns
            WHERE data_type in ('CHAR', 'VARCHAR2', 'NCHAR', 'NVARCHAR2', 'CLOB', 'NCLOB')
              AND owner='SCHEMA_NAME'
            ) LOOP
    dbms_output.put_line('123123');
  END LOOP;
END;
/


-- Search for a value in all tables

DECLARE
  match_count integer;
  v_search_string varchar2(4000) := 'SOME_VALUE';
BEGIN  
  FOR t IN (SELECT owner, table_name, column_name FROM all_tab_columns
            WHERE data_type in ('CHAR', 'VARCHAR2', 'NCHAR', 'NVARCHAR2', 'CLOB', 'NCLOB') AND owner='SCHEMA_NAME')
  LOOP
    BEGIN
      EXECUTE IMMEDIATE    
        'SELECT COUNT(*) FROM '||t.owner || '.' || t.table_name|| ' WHERE '||t.column_name||' = :1'
          INTO match_count  
          USING v_search_string;
        
        IF match_count > 0 THEN 
          dbms_output.put_line( t.owner || '.' || t.table_name ||' '||t.column_name||' '||match_count );
        END IF; 
      EXCEPTION WHEN others THEN
          dbms_output.put_line( 'Error encountered trying to read ' || t.column_name || ' from ' || t.owner || '.' || t.table_name );
    END;
  END LOOP;
END;
/


-- Search for a value in all synonyms

DECLARE
  match_count integer;
  v_search_string varchar2(4000) := 'DIRECTOR';
BEGIN  
  FOR t IN (SELECT als.OWNER, als.SYNONYM_NAME, atc.TABLE_NAME, atc.COLUMN_NAME
            FROM ALL_TAB_COLUMNS atc JOIN ALL_SYNONYMS als ON atc.table_name = als.table_name
            WHERE atc.DATA_TYPE in ('CHAR', 'VARCHAR2', 'NCHAR', 'NVARCHAR2', 'CLOB', 'NCLOB') AND als.OWNER='AGENDA_C')
  LOOP
    BEGIN
      EXECUTE IMMEDIATE    
        'SELECT COUNT(*) FROM '||t.owner || '.' || t.synonym_name|| ' WHERE '||t.column_name||' LIKE :1'
          INTO match_count  
          USING '%' || v_search_string || '%';
          
        IF match_count > 0 THEN 
          dbms_output.put_line( t.owner || '.' || t.synonym_name ||' '||t.column_name||' '||match_count );
        END IF; 
      EXCEPTION
        WHEN others THEN
          dbms_output.put_line( 'Error encountered trying to read ' || t.column_name || ' from ' || t.owner || '.' || t.synonym_name );
    END;
  END LOOP;
END;
/
