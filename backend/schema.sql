-- SQLite3 database schema for to-do list app
-- To create a new database:
--   sqlite3 data.db
--   .read schema.sql
--   .exit

CREATE TABLE task (
    id integer primary key, 
    name text, 
    description text, 
    done bool);

