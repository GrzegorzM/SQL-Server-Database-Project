select * from tblCustomersUSA;
select * from tblCustomersUK;

select * from tblCustomersUSA
union all -- all rows
select * from tblCustomersUK;

select * from tblCustomersUSA
union -- distinct sorted rows without duplicates
select * from tblCustomersUK;

select * from tblCustomersUSA
union -- distinct sorted rows without duplicates
select * from tblCustomersUK
order by Name;