CREATE TABLE [dbo].[tblProductSaleOperations]
(
	[ProductSalesId] INT NOT NULL PRIMARY KEY identity(1, 1),
	ProductId int foreign key references tblProduct(ProductId) NOT NULL,
	QuantitySold int NOT NULL
)
