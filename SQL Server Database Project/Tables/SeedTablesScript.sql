/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

insert into tblProduct values('Laptop', 2200, 100);
insert into tblProduct values('Desktop', 1200, 246);

insert into tblMailingAddress values (1, 120, 'Sesame Street', 'Manchester', '12-323');
insert into tblPhysicalAddress values (1, 120, 'Sesame Street', 'Manchester', '12-323');

insert into tblProducts1 values ('TV', '40 inch LCD TV');
insert into tblProducts1 values ('Laptop', '20 inch Acer');
insert into tblProducts1 values ('Desktop', 'HP High Performance');

insert into tblProductSales1 values (3, 400, 5);
insert into tblProductSales1 values (2, 200, 7);
insert into tblProductSales1 values (3, 350, 2);
insert into tblProductSales1 values (3, 450, 4);

-- Recursive CTE table seed
declare @MaxId int;
set @MaxId = 1000000;
WITH cte_Products as (
 SELECT 1 as ID,'Product - ' + CAST((1) as nvarchar(20)) as Name,'Product - ' + CAST((1) as nvarchar(20)) + ' Description' as Description
 UNION ALL
 SELECT cte.ID + 1 as ID,'Product - ' + CAST((cte.ID + 1) as nvarchar(20)) as Name,'Product - ' + CAST((cte.ID + 1) as nvarchar(20)) + ' Description' as Description
    FROM cte_Products cte WHERE cte.ID < @MaxId
)
Insert into tblProducts2 SELECT Name,Description FROM cte_Products OPTION (MAXRECURSION 0)

-- Random values table seed
declare @RandomUnitPrice int;
declare @RandomQuantitySold int;
declare @Id int;
set @Id = 1;
declare @MinValue int;
set @MinValue = 1;
declare @MaxValue int;
set @MaxValue = 10;

while ( @Id <= 500000 ) -- 50% of Products
begin
	select @RandomUnitPrice = ceiling(@MaxValue * Rand());
	select @RandomQuantitySold = ceiling(@MaxValue * Rand());
	insert into tblProductSales2 values(@Id, @RandomUnitPrice, @RandomQuantitySold);
	set @Id = @Id + 1;
end

insert into tblStudentSource values('Mike');
insert into tblStudentSource values('Sara');
insert into tblStudentDestination values('Mike M');
insert into tblStudentDestination values('John');

insert into Accounts values('Mark', 1000);
insert into Accounts values('Mary', 1000);

insert into tblGender values(1, 'Male');
insert into tblGender values(1, 'Female');
insert into tblGender values(1, 'None');

Insert into tblDepartment values (1, 'IT', 'London', 'Rick');
Insert into tblDepartment values (2, 'Payroll', 'Delhi', 'Ron');
Insert into tblDepartment values (3, 'HR', 'New York', 'Christie');
Insert into tblDepartment values (4, 'Other Department', 'Sydney', 'Cindrella');

Insert into tblEmployee values (1, 'Tom', 'Male', 4000, 1);
Insert into tblEmployee values (2, 'Pam', 'Female', 3000, 3);
Insert into tblEmployee values (3, 'John', 'Male', 3500, 1);
Insert into tblEmployee values (4, 'Sam', 'Male', 4500, 2);
Insert into tblEmployee values (5, 'Todd', 'Male', 2800, 2);
Insert into tblEmployee values (6, 'Ben', 'Male', 7000, 1);
Insert into tblEmployee values (7, 'Sara', 'Female', 4800, 3);
Insert into tblEmployee values (8, 'Valarie', 'Female', 5500, 1);
Insert into tblEmployee values (9, 'James', 'Male', 6500, NULL);
Insert into tblEmployee values (10, 'Russell', 'Male', 8800, NULL);

Insert Into tblEmployeeSelfJoin values ('Tom', 'Josh');
Insert Into tblEmployeeSelfJoin values ('Josh', NULL);
Insert Into tblEmployeeSelfJoin values ('Mike', 'Josh');
Insert Into tblEmployeeSelfJoin values ('John', 'Mike');
Insert Into tblEmployeeSelfJoin values ('Pam', 'Tom');
Insert Into tblEmployeeSelfJoin values ('Mary', 'Mike');
Insert Into tblEmployeeSelfJoin values ('James', 'Tom');
Insert Into tblEmployeeSelfJoin values ('Sam', 'Pam');
Insert Into tblEmployeeSelfJoin values ('Simon', 'Tom');