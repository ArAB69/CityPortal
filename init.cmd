set UB_HOST=http://localhost:8881
REM set UB_USER=admin
REM set UB_PWD=admin

REM create folders for files
call npx ubcli createStore
@if errorlevel 1 goto err1

REM create DB (for postgreSQL, MySQL, etc)
REM call npx ubcli initDB -drop -create -p admin -dba postgres -dbaPwd postgres
REM create DB (for SQLite)
call npx ubcli initDB -drop -create -p admin
REM call npx ubcli initDB -drop -create
@if errorlevel 1 goto err1

REM create tables in db
call npx ubcli generateDDL -autorun
@if errorlevel 1 goto err1

REM fill tables with init data
call npx ubcli initialize -u admin -p admin
REM call npx ubcli generateDDL -autorun
@if errorlevel 1 goto err1

call npx ubcli initialize
@goto eof

:err1
echo Something wrong
exit 1

:eof