CREATE TABLE [dbo].[tblInventory]
(
	Id int primary key identity(1, 1),
	Product nvarchar(50) not null,
	ItemsInStock int not null
)
