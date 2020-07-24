CREATE PROCEDURE [dbo].[spSearchEmployees]
	@Name nvarchar(50) = null,
	@Email nvarchar(50) = null,
	@Gender nvarchar(50) = null,
	@Age int = null
as
	select * from tblEmployee
	where (Name = @Name or @Name is null) and (Gender = @Gender or @Gender is null)