CREATE TABLE [dbo].[tblEmployee]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NCHAR(50) NOT NULL, 
    [Gender] NCHAR(50) NOT NULL, 
    [Salary] INT NOT NULL, 
    [DepartmentId] INT NULL Foreign Key References tblDepartment(Id),
)
