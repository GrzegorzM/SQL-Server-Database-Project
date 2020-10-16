--Transaction 1(New Query Window)
begin transaction
	update tblInventory set ItemsInStocks = 9 where Id = 1;
waitfor delay '00:00:15'; --15 sec delay
rollback transaction;

--Transaction 2(Diffrent Query Window)
select * from tblInventory where Id = 1; --Read commited(default isolation level of transaction) will be blocked till transaction1 gonna end
--reading uncommited data = dirty data

--change isolation level so we can read dirty data
set transaction isolation level read uncommitted; --allowing read uncommitted data = dirty read
select * from tblInventory where Id = 1;

--nolock same effect as changing isolation level
select * from tblInventory (nolock) where Id = 1;

create table tblInventory
(
	Id int primary key identity(1, 1),
	Product nvarchar(50) not null,
	ItemsInStock int not null
)