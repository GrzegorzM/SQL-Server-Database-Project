CREATE TABLE [dbo].[tblProductSales]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [SalesAgent] NCHAR(50) NOT NULL, 
    [SalesCountry] NCHAR(50) NOT NULL, 
    [SalesAmount] INT NOT NULL
)
