create or replace directory MY_DUMP_DIR as '/root';
grant read, write on directory MY_DUMP_DIR to jdbc;