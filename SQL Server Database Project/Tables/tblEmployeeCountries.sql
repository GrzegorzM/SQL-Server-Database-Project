CREATE TABLE [dbo].[tblEmployeeCountries]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[Name] NVARCHAR(50) NOT NULL,
  [Gender] NVARCHAR(10) NOT NULL,
  [Salary] INT NOT NULL,
  [Country] NVARCHAR(10) NOT NULL, 
)
