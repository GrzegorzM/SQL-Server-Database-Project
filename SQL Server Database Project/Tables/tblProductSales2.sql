CREATE TABLE [dbo].[tblProductSales2]
(
	Id int primary key identity(1, 1),
	ProductId int foreign key references tblProducts2(Id),
	UnitPrice int not null,
	QuantitySold int not null
)
