CREATE TABLE [dbo].[tblCountrySales]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	[Continent] NVARCHAR(50) NOT NULL,
	[Country] NVARCHAR(50) NOT NULL,
	[City] NVARCHAR(50),
	[SaleAmount] INT NOT NULL
)
