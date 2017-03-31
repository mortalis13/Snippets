"c:\xampp\mysql\bin\mysqldump.exe" -u root -B export_test > "c:\out_compact.sql"
"c:\xampp\mysql\bin\mysqldump.exe" -u root --skip-opt --add-drop-table --add-locks --create-options --disable-keys --lock-tables --quick --set-charset -B export_test > "c:\out_full.sql"

"c:\xampp\mysql\bin\mysql.exe" -u root < "c:\in.sql"

rem "c:\xampp\mysql\bin\mysqldump.exe" --skip-opt -u root export_test > "c:\out.sql"
