CREATE TABLE [dbo].[tblPerson]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NCHAR(50) NOT NULL, 
    [Email] NCHAR(50) NOT NULL, 
    [GenderId] INT NOT NULL Foreign Key References tblGender(Id),
    [Age] INT NULL
)
