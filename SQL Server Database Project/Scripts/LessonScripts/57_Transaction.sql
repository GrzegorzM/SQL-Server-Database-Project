-- Enables read updated data from tables with not commited transaction, gonna show old data values before update.
set transaction isolation level read uncommitted;

create procedure spUpdateAddress
as
	begin try
		begin transaction
			update tblMailingAddress set City = 'London' where AddressId = 1 and EmployeeNumber = 1;
			update tblPhysicalAddress set City = 'London' where AddressId = 1 and EmployeeNumber = 1;
			commit transaction;
			print 'Transaction Commited';
		end try

	begin catch
		rollback transaction;
		print 'Transaction Rolled Back';
	end catch

exec spUpdateAddress;

create table tblMailingAddress
(
	AddressId int primary key identity(1, 1),
	EmployeeNumber int not null,
	HouseNumber nvarchar(10) not null,
	StreetAddress nvarchar(50) not null,
	City nvarchar(50) not null,
	PostalCode nvarchar(50) not null
)

create table tblPhysicalAddress
(
	AddressId int primary key identity(1, 1),
	EmployeeNumber int not null,
	HouseNumber nvarchar(10) not null,
	StreetAddress nvarchar(50) not null,
	City nvarchar(50) not null,
	PostalCode nvarchar(50) not null
)

insert into tblMailingAddress values (1, 120, 'Sesame Street', 'Manchester', '12-323');
insert into tblPhysicalAddress values (1, 120, 'Sesame Street', 'Manchester', '12-323');
select * from tblMailingAddress;
select * from tblPhysicalAddress;