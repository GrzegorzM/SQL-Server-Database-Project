select * from tblPerson;
-- Better performance to specify column list
SELECT TOP (1000) [Id]
      ,[Name]
      ,[Email]
      ,[GenderId]
      ,[Age]
      FROM [Sample].[dbo].[tblPerson];

Select DISTINCT Name from tblPerson;
-- Distrinct across of all specified columns
Select DISTINCT Name, Email from tblPerson;

select * from tblPerson where Name = 'Mark';
select * from tblPerson where Name <> 'Mark';
select * from tblPerson where Name != 'Mark';
select * from tblPerson where Age = 20 or Age = 23 or Age = 29;
select * from tblPerson where Age in(20, 23, 29);
select * from tblPerson where Age Between 20 And 25;
select * from tblPerson where Name like 'M%';
select * from tblPerson where Email not like '%@%';
select * from tblPerson where Email like '_@_.com';
select * from tblPerson where Name like '[MST]%';
select * from tblPerson where Name like '[^MST]%';
select * from tblPerson order by Name desc, Age asc;
select Top 10 * from tblPerson;
select Top 10 Name, Email from tblPerson;
select Top 50 Percent Name, Email from tblPerson;
Select Top 1 * from tblPerson Order by Age desc;