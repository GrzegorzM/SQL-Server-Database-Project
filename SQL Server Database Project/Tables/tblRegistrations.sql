CREATE TABLE [dbo].[tblRegistrations]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NCHAR(50) NOT NULL, 
    [Email] NCHAR(50) NOT NULL, 
    [RegisteredDate] DATETIME NOT NULL
)
