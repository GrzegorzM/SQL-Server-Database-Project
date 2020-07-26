create procedure spSearchEmployees
@Name nvarchar(50),
@Email nvarchar(50),
@Gender nvarchar(50),
@Age int
as
	select * from tblEmployee
	where Name = @Name and Gender = @Gender

spSearchEmployees -- Wont work if we dont specify parameters
spSearchEmployees 'John', 'bob@email.com', 'Male', 31

alter procedure spSearchEmployees
@Name nvarchar(50) = null,
@Email nvarchar(50) = null,
@Gender nvarchar(50) = null,
@Age int = null
as
	select * from tblEmployee
	where (Name = @Name or @Name is null) and (Gender = @Gender or @Gender is null)

spSearchEmployees -- Now parameters are optional and the procedure will run w/o any specified parameters