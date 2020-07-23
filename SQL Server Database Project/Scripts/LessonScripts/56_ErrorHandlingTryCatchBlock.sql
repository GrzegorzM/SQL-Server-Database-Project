create procedure spSellProductsTryCatch
	@ProductId int,
	@QuantityToSell int
as
	-- Check available stock of product we want to sell
	declare @StockAvailable int;
	select @StockAvailable = QuantityAvailable from tblProduct where ProductId = @ProductId;

	-- Raise error if user want to buy more then available in stock
	if(@StockAvailable < @QuantityToSell)
	begin
		raiserror('Not enough stock available', 16, 1)
	end
	else 
	begin
		begin try
			begin transaction
				-- Reduce available quantity of product we want to sell
				update tblProduct set QuantityAvailable = (QuantityAvailable - @QuantityToSell) where ProductId = @ProductId;

				-- Save info about sold products into table
				insert into tblProductSaleOperations values(123, @QuantityToSell);
				commit transaction;
		end try
		begin catch
			rollback transaction;
			select 
				ERROR_NUMBER() as ErrorNumber,
				ERROR_MESSAGE() as ErrorMessage,
				ERROR_PROCEDURE() as ErrorProcedure,
				ERROR_STATE() as ErrorState,
				ERROR_SEVERITY() as ErrorSeverity,
				ERROR_LINE() as ErrorLine
		end catch
	end

exec spSellProductsTryCatch 1, 3;