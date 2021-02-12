DROP TABLE tblDepartment; -- Could not drop object 'tblDepartment' because it is referenced by a FOREIGN KEY constraint.
DROP TABLE tblEmployee; -- Cannot DROP TABLE 'tblEmployee' because it is being referenced by object 'fnGetNameById'.

-- Creating copy of tblPerson table.
SELECT * INTO tblPersonCopy FROM tblPerson;
SELECT * FROM tblPersonCopy;
-- Droping tblPerson.
DROP TABLE tblPerson;-- It will work, but all dependent objects will stop working.
-- Executing stored procedure which is dependent on tblPerson table.
DECLARE @Count INT;
EXEC @Count = spGetPeopleCount; -- Invalid object name 'tblPerson'.
SELECT @Count;
-- Restore oryginal tblPeson table and drop a copy.
SELECT * INTO tblPerson FROM tblPersonCopy;
DROP TABLE tblPersonCopy;
DECLARE @Count INT;
EXEC @Count = spGetPeopleCount; -- Now works as expected.
SELECT @Count AS [Count];


-- Right click on the object and choose View Dependencies option in SQL Server Management studio to find the object dependencies.