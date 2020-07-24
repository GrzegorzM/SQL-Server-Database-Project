if ( exists(select * from information_schema.tables where table_name = 'tblProductSales2') )
begin
	drop table tblProductSales2;
end

if( exists(select * from information_schema.tables where table_name = 'tblProducts2') )
begin
	drop table tblProducts2;
end

create table tblProducts2
(
	Id int primary key identity(1, 1),
	Name nvarchar(50) not null,
	Description nvarchar(50) not null
)

create table tblProductSales2
(
	Id int primary key identity(1, 1),
	ProductId int foreign key references tblProducts2(Id),
	UnitPrice int not null,
	QuantitySold int not null
)

-- Table seed
declare @Id int;
set @Id = 1;
while( @Id <= 10000 )
begin
	insert into tblProducts2 values('Product - ' + cast(@Id as nvarchar(5)), 'Product - ' + cast(@Id as nvarchar(5)) + 'Description')
	set @Id = @Id + 1;
end

-- Recursive CTE table seed
declare @MaxId int;
set @MaxId = 10000;
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

while ( @Id <= 10000 )
begin
	select @RandomUnitPrice = ceiling(@MaxValue * Rand());
	select @RandomQuantitySold = ceiling(@MaxValue * Rand());
	insert into tblProductSales2 values(@Id, @RandomUnitPrice, @RandomQuantitySold);
	set @Id = @Id + 1;
end

select * from tblProducts2;
select * from tblProductSales2;


-- Random values table seed test
declare @rand int;
while (1=1)
begin
	select @rand = ceiling(10 * rand());
	if(@rand < 1 or @rand > 10)
	begin
		print('Error - ' + cast(@rand as nvarchar(10)));
	end
end

select UnitPrice, count(Id) as Total from tblProductSales2 group by UnitPrice;
select QuantitySold, count(Id) as Total from tblProductSales2 group by QuantitySold;