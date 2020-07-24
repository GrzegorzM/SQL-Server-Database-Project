create table tblStudentSource
(
	Id int primary key identity(1, 1),
	Name nvarchar(50) not null
)

create table tblStudentDestination
(
	Id int primary key identity(1, 1),
	Name nvarchar(50) not null
)

insert into tblStudentSource values('Mike');
insert into tblStudentSource values('Sara');
insert into tblStudentDestination values('Mike M');
insert into tblStudentDestination values('John');

merge into tblStudentDestination as D
using tblStudentSource as S
on D.Id = S.Id
when matched then
	update set D.Name = S.Name
when not matched by target then
	insert values (S.Name)
when not matched by source then
	delete;

select * from tblStudentSource;
select * from tblStudentDestination;
truncate table tblStudentSource; -- Deletes data inside table, but not table itself
truncate table tblStudentDestination;