-- Create database
create database SampleDB;

-- Altering database
alter database SampleDB modify Name = SampleDatabase;
sp_renameDB 'SampleDatabase', 'SampleDB';

-- Cannot drop database currently in use. Forcing to rollback all transactions and close open connections to database.
alter database SampleDB set single_user with rollback immediate;

-- Drop database
drop database SampleDB;
drop database master; -- Error --> cannot drop system databases