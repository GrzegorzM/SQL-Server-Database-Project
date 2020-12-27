CREATE TABLE [dbo].[tblSales]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
	Product Nvarchar(50) NOT NULL,
	SaleAmount Int NOT NULL
)