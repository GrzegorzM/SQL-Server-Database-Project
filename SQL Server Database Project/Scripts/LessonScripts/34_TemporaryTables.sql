-- Create Local Temorary Table - destroyed when the session that created local temporary table is closed.
CREATE TABLE #tblPersonDetails(
	Id int,
	Name nvarchar(50)
);

-- Insert Data Into The Temorary Table
Insert into #tblPersonDetails Values(1, 'Bob');

-- Select Data From The Temorary Table
Select * from #tblPersonDetails;

-- The Sql server appends random chars at the end of the name, so we need to use the 'like' keyword.
Select * from tempdb..sysobjects Where Name Like '#tblPersonDetails%';

-- Drop The Temporary Table
Drop Table #tblPersonDetails;

-- If the temporary table, is created inside the stored procedure, it get's dropped automatically upon the completion of stored procedure execution.
CREATE Procedure spCreateLocalTempTable
As Begin
	Create Table #tblPersonDetails(Id int, Name nvarchar(20));

	Insert into #tblPersonDetails Values(1, 'Anastasia');
	Insert into #tblPersonDetails Values(2, 'John');
	Insert into #tblPersonDetails Values(3, 'Mary');

	Select * from #tblPersonDetails;
End;

Execute spCreateLocalTempTable;
Select * from #tblPersonDetails;

-- Global Temporary Table - destroyed when the last connection that referencing the global temporary table is closed.
CREATE TABLE ##tblEmployeeDetails(
	Id int,
	Name nvarchar(50)
);
Insert into ##tblEmployeeDetails Values(1, 'Bob');
Select * from ##tblEmployeeDetails; -- Data is available for all connections.
Select * from tempdb..sysobjects Where Name = '##tblEmployeeDetails'; -- Global temporary tables do not require a hash at the end of their name to distinguish between connections.