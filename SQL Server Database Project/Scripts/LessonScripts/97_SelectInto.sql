Select * from tblEmployee;
Select * from tblDepartment;

-- Copy of an existing table (backup)
SELECT * INTO tblEmployeeBackup FROM tblEmployee;
Select * from tblEmployeeBackup;
DROP TABLE tblEmployeeBackup;

-- Backup to another database
SELECT * INTO DatabaseName.dbo.tblEmployeeBackup FROM tblEmployee;
Select * from DatabaseName.dbo.tblEmployeeBackup;
DROP TABLE DatabaseName.dbo.tblEmployeeBackup;

-- Copy only selected columns into new table
SELECT Id, Name, Gender INTO tblEmployeeBackup FROM tblEmployee;
Select * from tblEmployeeBackup;
DROP TABLE tblEmployeeBackup;

-- Copy only selected rows into new table
SELECT * INTO tblEmployeeBackup FROM tblEmployee WHERE Gender = 'Male';
Select * from tblEmployeeBackup;
DROP TABLE tblEmployeeBackup;

-- Copy columns from 2 or more tables into a new table
SELECT * INTO tblEmployeeBackup FROM tblEmployee e -- Error - Column names in each table must be unique. Column name 'DeptID' in table 'tblEmployeeBackup' is specified more than once.
join tblDepartment d on e.DeptID = d.DeptID;
SELECT e.*, d.DeptName INTO tblEmployeeBackup FROM tblEmployee e
join tblDepartment d on e.DeptID = d.DeptID;
Select * from tblEmployeeBackup;
DROP TABLE tblEmployeeBackup;

-- Copying a table schema without any data (creating an empty table)
SELECT * INTO tblEmployeeBackup FROM tblEmployee WHERE 1 <> 1;

-- Cannot use SELECT INTO statement to select data into an existing table(The table "tblEmployeeBackup" is created in the database and is not dropped)
SELECT * INTO tblEmployeeBackup FROM tblEmployee; -- Error - There is already an object named 'tblEmployeeBackup' in the database.

-- INSERT INTO is required to select data into an existing table
INSERT INTO tblEmployeeBackup SELECT * FROM tblEmployee;

TRUNCATE TABLE tblEmployeeBackup;
INSERT INTO tblEmployeeBackup (Id, Name, Gender) SELECT Id, Name, Gender FROM tblEmployee;

Select * from tblEmployeeBackup;
DROP TABLE tblEmployeeBackup;

