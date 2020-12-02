-- All aggregate functions are deterministic functions. Deterministic functions always return the same result any time they are called with a specific set of input values and given the same state of the database.
Select Count(Id) from tblEmployee;
Select SQUARE(3);
Select RAND(1); -- same value every time

-- Nondeterministic functions may return different results each time they are called with a specific set of input values even if the database state that they access remains the same.
Select GetDate();
Select CURRENT_TIMESTAMP;
Select RAND(); -- different value every time

-- Encryption
CREATE FUNCTION fnGetNameById(@id int) Returns nvarchar(30)
AS BEGIN
	Return (Select Name from tblEmployee where Id = @id);
END;

Select dbo.fnGetNameById(1);
sp_helptext fnGetNameById;

ALTER FUNCTION fnGetNameById(@id int) Returns nvarchar(50)
WITH ENCRYPTION
AS BEGIN
	RETURN (Select Name from tblEmployee where Id = @id);
END;

-- Preventing the deletion of data on which the function depends.
ALTER FUNCTION fnGetNameById(@id int) Returns nvarchar(50)
WITH SCHEMABINDING
AS BEGIN
	Return (Select Name from dbo.tblEmployee where Id = @id);
END;

DROP TABLE tblEmployee; -- Cannot DROP TABLE 'tblEmployee' because it is being referenced by object 'fnGetNameById'.