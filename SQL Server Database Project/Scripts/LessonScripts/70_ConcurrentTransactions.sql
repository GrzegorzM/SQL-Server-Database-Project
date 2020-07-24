begin try
	begin transaction
		update tblAccounts set Balance = Balance - 100 where Id = 1;
		update tblAccounts set Balance = Balance - 100 where Id = 2;
		commit transaction
		print 'Transaction commited';
end try
begin catch
	rollback transaction
	print 'Transaction rolled back';
end catch

create table tblAccounts
(
	Id int primary key identity(1, 1),
	AccountName nvarchar(50) not null,
	Balance int not null
)
insert into tblAccounts values('Mark', 1000);
insert into tblAccounts values('Mary', 1000);