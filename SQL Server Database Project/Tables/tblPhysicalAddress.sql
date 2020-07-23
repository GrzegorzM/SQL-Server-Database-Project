CREATE TABLE [dbo].[tblPhysicalAddress]
(
	AddressId int primary key identity(1, 1),
	EmployeeNumber int not null,
	HouseNumber nvarchar(10) not null,
	StreetAddress nvarchar(50) not null,
	City nvarchar(50) not null,
	PostalCode nvarchar(50) not null
)
