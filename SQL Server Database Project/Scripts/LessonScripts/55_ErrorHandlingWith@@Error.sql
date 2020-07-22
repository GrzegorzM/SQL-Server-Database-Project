create table tblProduct
(
	ProductId int identity(1, 1) primary key,
	Name nvarchar(50),
	UnitPrice int,
	QuantityAvailable int
)
insert into tblProduct values('Laptop', 2200, 100);
insert into tblProduct values('Desktop', 1200, 246);

create table tblProductSaleOperations
(
	ProductSalesId int primary key identity(1, 1),
	ProductId int foreign key references tblProduct(ProductId),
	QuantitySold int
)

create procedure spSellProducts
	@ProductId int,
	@QuantityToSell int
as
	-- Check available stock of product we want to sell
	declare @StockAvailable int;
	select @StockAvailable = QuantityAvailable from tblProduct where ProductId = @ProductId;

	-- Raise error if user want to buy more then availavle in stock
	if(@StockAvailable < @QuantityToSell)
	begin
		raiserror('Not enough stock available', 16, 1)
	end
	else
		begin
			begin transaction
				-- Reduce available quantity of product we want to sell
				update tblProduct set QuantityAvailable = (QuantityAvailable - @QuantityToSell) where ProductId = @ProductId;

				-- Code to calculate value of Id field in tblProductSaleoperations table if it's not identity column
				--declare @MaxProductSalesId int;
				--select @MaxProductSalesId = case when
				--								max(ProductSalesId) is null
				--								then 0 else max(ProductSalesId) + 1 end
				--							from tblProductSaleOperations;
				--insert into tblProductSaleOperations values(@MaxProductSalesId, @ProductId, @QuantityToSell);

				-- Save info about sold products into table
				insert into tblProductSaleOperations values(@ProductId, @QuantityToSell);

			-- @@Error returns number different from 0 if error occurs in last statement. =0 --> success, <>0 --> failure
			if(@@ERROR <> 0)
			begin
				rollback transaction
				end
			else
			begin
				commit transaction
				end;
		end

exec spSellProducts 1, 2;
select * from tblProduct;
select * from tblProductSaleOperations;