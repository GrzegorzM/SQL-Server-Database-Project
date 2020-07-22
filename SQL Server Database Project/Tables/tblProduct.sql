CREATE TABLE [dbo].[tblProduct]
(
	[ProductId] INT NOT NULL PRIMARY KEY identity(1, 1),
	Name nvarchar(50) NOT NULL,
	UnitPrice int NOT NULL,
	QuantityAvailable int NOT NULL
)
