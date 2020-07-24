use [Sample]
create database tblProducts2
(
	Id int primary key identity(1, 1)
) -- Error table already exist

-- reRunnable script to create table
if not exists(select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'tblTableToDelete')
begin
	create table tblTableToDelete
	(
		Id int primary key identity(1, 1)
	)
	print 'Table tblTableToDelete created';
end
else
begin
	print 'Table tblTableToDelete already exists';
end

-- Drop and recreate table
if OBJECT_ID('tblTableToDelete') is not null
begin
	drop table tblTableToDelete;
end
create table tblTableToDelete
(
	Id int primary key identity(1, 1)
)

-- reRunnable script to alter table column
use [Sample]
if not exists(select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME = 'EmailAddress' and table_name = 'tblTableToDelete' and table_schema = 'dbo')
begin
	alter table tblTableToDelete
	add EmailAddress nvarchar(50)
	print 'Table tblTableToDelete altered';
end
else
begin
	print 'Column EmailAddress already exists';
end

--Using col_length
if COL_LENGTH('tblTableToDelete', 'EmailAddress') is not null
begin
	print 'Column already exists';
end
else
begin
	print 'Column does not exists';
end

-- Drop and recreate table
if OBJECT_ID('tblTableToDelete') is not null
begin
	drop table tblTableToDelete;
end
create table tblTableToDelete
(
	Id int primary key identity(1, 1)
)