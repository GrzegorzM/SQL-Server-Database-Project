CREATE TABLE [dbo].[tblProductSales1]
(
	Id int primary key identity(1, 1),
	ProductId int foreign key references tblProducts1(Id),
	UnitPrice int not null,
	QuantitySold int not null
)
