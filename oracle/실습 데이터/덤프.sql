CREATE OR REPLACE DIRECTORY MY_DUMP_DIR AS 'C:\dev';
GRANT READ, WRITE ON DIRECTORY MY_DUMP_DIR TO JDBC;