Create Table tblPerson1(
	Id int Identity,
	Name nvarchar(50) NOT NULL
)

Insert into tblPerson1 values('Mike');
Set Identity_Insert tblPerson1 ON;
Insert into tblPerson1 (Id, Name) values(2, 'Mary');
Set Identity_Insert tblPerson1 OFF;
Insert into tblPerson1 values('Mark');
select * from tblPerson1;

DBCC CHECKIDENT(tblPerson1, ReSeed, 0);-- Reset Identity Value