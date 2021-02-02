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

Insert into tblEmployee values (1, 'Tom', 'Male', 4000, 1, GetDate());
Insert into tblEmployee values (2, 'Pam', 'Female', 3000, 3, GetDate());
Insert into tblEmployee values (3, 'John', 'Male', 3500, 1, NULL);
Insert into tblEmployee values (4, 'Sam', 'Male', 4500, 2, NULL);
Insert into tblEmployee values (5, 'Todd', 'Male', 2800, 2, NULL);
Insert into tblEmployee values (6, 'Ben', 'Male', 7000, 1, NULL);
Insert into tblEmployee values (7, 'Sara', 'Female', 4800, 3, NULL);
Insert into tblEmployee values (8, 'Valarie', 'Female', 5500, 1, NULL);
Insert into tblEmployee values (9, 'James', 'Male', 6500, NULL, NULL);
Insert into tblEmployee values (10, 'Russell', 'Male', 8800, NULL, NULL);

Insert Into tblEmployeeSelfJoin values ('Tom', 'Josh');
Insert Into tblEmployeeSelfJoin values ('Josh', NULL);
Insert Into tblEmployeeSelfJoin values ('Mike', 'Josh');
Insert Into tblEmployeeSelfJoin values ('John', 'Mike');
Insert Into tblEmployeeSelfJoin values ('Pam', 'Tom');
Insert Into tblEmployeeSelfJoin values ('Mary', 'Mike');
Insert Into tblEmployeeSelfJoin values ('James', 'Tom');
Insert Into tblEmployeeSelfJoin values ('Sam', 'Pam');
Insert Into tblEmployeeSelfJoin values ('Simon', 'Tom');

Insert Into tblEmployeeNames values ('Sam', NULL, NULL);
Insert Into tblEmployeeNames values (NULL, 'Todd', 'Tanzan');
Insert Into tblEmployeeNames values (NULL, NULL, 'Sara');
Insert Into tblEmployeeNames values ('Ben', 'Parker', NULL);
Insert Into tblEmployeeNames values ('James', 'Nick', 'Nancy');

Insert Into tblCustomersUK values ('Bob', 'bob@mail.com');
Insert Into tblCustomersUK values ('Sara', 'sara@mail.com');

Insert Into tblCustomersUSA values ('Kamala', 'kamala@mail.com');
Insert Into tblCustomersUSA values ('Sara', 'sara@mail.com');


INSERT INTO tblDateTime VALUES (GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE());

Insert Into tblRegistrations Values ('John', 'john@j.com' , '2020-02-01 22:06:15.173');
Insert Into tblRegistrations Values ('Sam', 'sam@mail.com' , '2020-02-01 02:02:23.228');
Insert Into tblRegistrations Values ('Todd', 'todd@mail.com' , '2020-04-11 07:32:58.346');
Insert Into tblRegistrations Values ('Mary', 'mary@mail.com' , '2020-04-11 12:12:03.030');
Insert Into tblRegistrations Values ('Mike', 'mike@mail.com' , '2020-02-01 04:15:55.441');

Insert into tblProductSales values('Tom', 'UK', 200)
Insert into tblProductSales values('John', 'USA', 180)
Insert into tblProductSales values('John', 'UK', 260)
Insert into tblProductSales values('David', 'Germany', 450)
Insert into tblProductSales values('Tom', 'France', 350)
Insert into tblProductSales values('David', 'USA', 200)
Insert into tblProductSales values('Tom', 'USA', 130)
Insert into tblProductSales values('John', 'France', 540)
Insert into tblProductSales values('John', 'UK', 120)
Insert into tblProductSales values('David', 'UK', 220)
Insert into tblProductSales values('John', 'UK', 420)
Insert into tblProductSales values('David', 'USA', 320)
Insert into tblProductSales values('Tom', 'USA', 340)
Insert into tblProductSales values('Tom', 'UK', 660)
Insert into tblProductSales values('John', 'Germany', 430)
Insert into tblProductSales values('David', 'France', 230)
Insert into tblProductSales values('David', 'Germany', 280)
Insert into tblProductSales values('Tom', 'UK', 480)
Insert into tblProductSales values('John', 'USA', 360)
Insert into tblProductSales values('David', 'UK', 140)

Insert into tblSales values ('iPhone', 500);
Insert into tblSales values ('Laptop', 800);
Insert into tblSales values ('iPhone', 1000);
Insert into tblSales values ('Speakers', 400);
Insert into tblSales values ('Laptop', 600);

Insert into tblPersonA values ('Mark', 'Male');
Insert into tblPersonA values ('Mary', 'Female');
Insert into tblPersonA values ('Steve', 'Male');
Insert into tblPersonA values ('John', 'Male');
Insert into tblPersonA values ('Sara', 'Female');

Insert into tblPersonB values ('John', 'Male');
Insert into tblPersonB values ('Sara', 'Female');
Insert into tblPersonB values ('Pam', 'Female');
Insert into tblPersonB values ('Rebeka', 'Female');
Insert into tblPersonB values ('Jordan', 'Male');

Insert Into tblEmployeeCountries Values ('Mark', 'Male', 5000, 'USA');
Insert Into tblEmployeeCountries Values ('John', 'Male', 4500, 'GERMANY');
Insert Into tblEmployeeCountries Values ('Pam', 'Female', 5500, 'USA');
Insert Into tblEmployeeCountries Values ('Sara', 'Female', 4000, 'GERMANY');
Insert Into tblEmployeeCountries Values ('Todd', 'Male', 3500, 'GERMANY');
Insert Into tblEmployeeCountries Values ('Mary', 'Female', 5000, 'UK');
Insert Into tblEmployeeCountries Values ('Ben', 'Male', 6500, 'UK');
Insert Into tblEmployeeCountries Values ('Elizabeth', 'Female', 7000, 'USA');
Insert Into tblEmployeeCountries Values ('Tom', 'Male', 5500, 'UK');
Insert Into tblEmployeeCountries Values ('Ron', 'Male', 5000, 'USA');

Insert into tblCountrySales values('Asia','India','Bangalore',1000);
Insert into tblCountrySales values('Asia','India','Chennai',2000);
Insert into tblCountrySales values('Asia','Japan','Tokyo',4000);
Insert into tblCountrySales values('Asia','Japan','Hiroshima',5000);
Insert into tblCountrySales values('Europe','United Kingdom','London',1000);
Insert into tblCountrySales values('Europe','United Kingdom','Manchester',2000);
Insert into tblCountrySales values('Europe','France','Paris',4000);
Insert into tblCountrySales values('Europe','France','Cannes',5000);

Insert into tblEmployeeDuplicates values(1, 'Mark', 'Hastings', 'Male', 60000);
Insert into tblEmployeeDuplicates values(1, 'Mark', 'Hastings', 'Male', 60000);
Insert into tblEmployeeDuplicates values(1, 'Mark', 'Hastings', 'Male', 60000);
Insert into tblEmployeeDuplicates values(2, 'Mary', 'Lambeth', 'Female', 30000);
Insert into tblEmployeeDuplicates values(2, 'Mary', 'Lambeth', 'Female', 30000);
Insert into tblEmployeeDuplicates values(3, 'Ben', 'Hoskins', 'Male', 70000);
Insert into tblEmployeeDuplicates values(3, 'Ben', 'Hoskins', 'Male', 70000);
Insert into tblEmployeeDuplicates values(3, 'Ben', 'Hoskins', 'Male', 70000);

INSERT INTO tblProductSalesUnpivot VALUES ('David', 960, 520, 360);
INSERT INTO tblProductSalesUnpivot VALUES ('John', 970, 540, 800);