CREATE TABLE [dbo].[tblEmployeeSelfJoin]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NCHAR(50) NOT NULL, 
    [ManagerId] INT NULL
)