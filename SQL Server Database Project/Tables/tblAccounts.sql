CREATE TABLE [dbo].[tblAccounts]
(
	Id int primary key identity(1, 1),
	AccountName nvarchar(50) not null,
	Balance int not null
)
