CREATE VIEW vEmployeeDetails
AS
	Select Id, Name, Salary, Gender from tblEmployee;
Select * from vEmployeeDetails;

-- Not possible to pass parameters to the view
CREATE VIEW vEmployeeDetails
@Gender nvarchar(10)
AS
	Select Id, Name, Salary, Gender from tblEmployee
	Where Gender = @Gender;
-- instead
Select * from vEmployeeDetails Where Gender = 'Male';
-- or create parametrized inline table function
CREATE FUNCTION fnEmployeeDetails(@Gender nvarchar(10))
RETURNS Table
AS
	RETURN (Select Id, Name, Salary, Gender from tblEmployee
				  Where Gender = @Gender);
Select * from dbo.fnEmployeeDetails('Male');

-- Not possible to use order by clause
ALTER VIEW vEmployeeDetails
AS
	Select Id, Name, Salary, Gender from tblEmployee
	Order by Name;

-- Cannot create views on Temp Tables
CREATE TABLE ##TempTable (ID int, Name nvarchar(20), Gender nvarchar(10));
CREATE VIEW vOnTempTable -- Error - views or functions are not allowed on temporary tables.
AS
	Select * from ##TempTable;