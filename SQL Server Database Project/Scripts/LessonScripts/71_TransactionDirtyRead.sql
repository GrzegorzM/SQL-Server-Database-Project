--Transaction 1
begin transaction
	update tblInventory set ItemsInStocks = 9 where Id = 1;
waitfor delay '00:00:15';
rollback transaction;

--Transaction 2
select * from tblInventory where Id = 1; --blocked till first transaction end

set transaction isolation level read uncommitted; --allowing read uncommitted data = dirty read
select * from tblInventory where Id = 1;