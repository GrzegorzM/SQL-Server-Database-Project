-- Clustered Index(only one per table - default primary key)
CREATE TABLE tblEmployeeIndexes(
 Id int Primary Key,
 Name nvarchar(50),
 Salary int,
 Gender nvarchar(10),
 City nvarchar(50)
);

sp_Helpindex tblEmployeeIndexes;

-- Non-sequential insertion of the Id column
Insert into tblEmployeeIndexes Values(3,'Kamala',3454,'Female','Moscow');
Insert into tblEmployeeIndexes Values(1,'Bob',5423,'Male','Dublin');
Insert into tblEmployeeIndexes Values(4,'Donald',6500,'Male','Stockholm');
Insert into tblEmployeeIndexes Values(5,'Mark',2340,'Male','Berlin');
Insert into tblEmployeeIndexes Values(2,'Jenna',5345,'Female','London');

select * from tblEmployeeIndexes; -- Returns data sorted by the Id column

DROP INDEX tblEmployeeIndexes.PK__tblEmplo__3214EC07DB830AB7; -- Error: It is being used for PRIMARY KEY constraint enforcement.
ALTER TABLE tblEmployeeIndexes DROP CONSTRAINT PK__tblEmplo__3214EC07DB830AB7; -- Removes the PRIMARY KEY constraint and its associated index.

CREATE CLUSTERED INDEX IX_tblEmployeeIndexes_Gender_Salary -- Impossible to create multiple clustered indexes, its possible to only create one, but it is possible for this single index to have multiple columns.
ON tblEmployeeIndexes (Gender DESC, Salary ASC);
select * from tblEmployeeIndexes; -- Returns data sorted by the Gender column in descending order, then by Salary in ascending order.

-- Nonclustered Index
CREATE NONCLUSTERED INDEX IX_tblEmployeeIndexes_Name
ON tblEmployeeIndexes(Name);

-- Clustered index is faster than a non clustered index, because, the non-clustered index has to refer back to the table, if the selected column is not present in the index.
-- Clustered index determines the storage order of rows in the table, and hence doesn't require additional disk space, but where as a Non Clustered index is stored seperately from the table, additional storage space is required.