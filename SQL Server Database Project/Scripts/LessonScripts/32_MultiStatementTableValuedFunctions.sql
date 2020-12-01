-- Inline table valued function
CREATE FUNCTION fnInlineGetEmployees() RETURNS TABLE
AS
	RETURN (Select Id, Name, CAST(DateOfBirth as DATE) as DateOfBirth from tblEmployee);

-- Multi statement table valued function
CREATE FUNCTION fnMultiGetEmployees() RETURNS @Table TABLE (Id int, Name nvarchar(20), DateOfBirth date)
AS BEGIN
	Insert into @Table
	Select Id, Name, CAST(DateOfBirth as DATE) from tblEmployee;
	Return;
END;

Select * from fnInlineGetEmployees();
Select * from fnMultiGetEmployees();

-- Correct
UPDATE fnInlineGetEmployees()
SET Name = 'Veronica' where Id = 11;

-- Error - not possible to update the underlying table, using an multi-statement table valued function
UPDATE fnMultiGetEmployees()
SET Name = 'Veronica' where Id = 11;

-- Inline Table valued functions are better for performance, than multi-statement table valued functions. If the given task, can be achieved using an inline table valued function, always prefer to use them, over multi-statement table valued functions.