CREATE TABLE [dbo].[tblEmployeeNames]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [FirstName] NCHAR(50) NULL, 
    [MiddleName] NCHAR(50) NULL, 
    [LastName] NCHAR(50) NULL
)
