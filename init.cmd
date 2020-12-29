REM create folders for files
call npx ubcli createStore

REM create DB (for postgreSQL, MySQL, etc)
call npx ubcli initDB -drop -create -p admin -dba postgres -dbaPwd postgres
REM create DB (for SQLite)
REM call npx ubcli initDB -drop -create -p admin

REM create tables in db
call npx ubcli generateDDL -autorun

REM fill tables with init data
call npx ubcli initialize -u admin -p admin