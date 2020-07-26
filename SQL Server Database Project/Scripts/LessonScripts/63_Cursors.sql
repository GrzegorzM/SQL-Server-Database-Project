declare @Id int
declare @Name nvarchar(50)

declare ProductCursor cursor for
select Id, Name from tblProducts2;
open ProductCursor;
fetch next from ProductCursor into @Id, @Name
while(@@fetch_status = 0) -- Status = 0 when cursor pointing on row(There are still rows to be processed)
begin
	print 'Id = ' + cast(@Id as nvarchar(5)) + ', Name = ' + @Name;
	fetch next from ProductCursor into @Id, @Name;
end
print @@fetch_status; -- value = -1(end of data set)
close ProductCursor;
deallocate ProductCursor;


declare @ProductId int;
declare ProductCursor cursor for
select ProductId from tblProductSales2;
open ProductCursor;
fetch next from ProductCursor into @ProductId;
while(@@fetch_status = 0) -- Status = 0 when cursor pointing on row(There are still rows to be processed)
begin
	declare @ProductName nvarchar(50);
	select @ProductName = Name from tblProducts2 where Id = @ProductId;

	if(@ProductName = 'Product - 55')
	begin
		update tblProductSales2 set UnitPrice = 55 where ProductId = @ProductId;
	end

	if(@ProductName = 'Product - 65')
	begin
		update tblProductSales2 set UnitPrice = 65 where ProductId = @ProductId;
	end

	if(@ProductName = 'Product - 100')
	begin
		update tblProductSales2 set UnitPrice = 100 where ProductId = @ProductId;
	end

	fetch next from ProductCursor into @ProductId;
	--case @ProductId
end
print @@fetch_status; -- value = -1(end of data set)
close ProductCursor;
deallocate ProductCursor;

select * from tblProducts2;
select * from tblProductSales2;;