DECLARE @sql NVARCHAR(1000);
SET @sql = 'SELECT * FROM tblEmployee';
EXECUTE SP_EXECUTESQL @sql;

DECLARE @sql NVARCHAR(1000);
DECLARE @params NVARCHAR(1000);
SET @sql = 'SELECT * FROM tblEmployee' + ' Where Name=@Name AND Gender=@Gender';
SET @params = '@Name NVARCHAR(100), @Gender NVARCHAR(10)';
PRINT @sql;
--EXECUTE SP_EXECUTESQL @sql, @params, @Name = 'John', @Gender = 'Male';
--EXECUTE SP_EXECUTESQL @sql, @params, @Gender = 'Male', @Name = 'John';
EXECUTE SP_EXECUTESQL @sql, @params, 'John', 'Male';