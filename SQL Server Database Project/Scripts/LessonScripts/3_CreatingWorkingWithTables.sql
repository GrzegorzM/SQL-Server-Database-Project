Use [SampleDB]
GO

Create Table tblPerson(
	Id int Primary Key,
	Name nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL,
	GenderId int
);

Create Table tblGender(
	Id int NOT NULL Primary Key,
	Gender nvarchar(50) NOT NULL
);

--FK_tblPerson_tblGender
Alter Table tblPerson Add Constraint tblPerson_GenderId_FK
Foreign Key (GenderId) references tblGender(Id);