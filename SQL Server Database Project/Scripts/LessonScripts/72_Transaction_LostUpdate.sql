SELECT * FROM tblProduct;

 -- Transaction 1
Begin Tran
	Declare @ItemsInStock int

	Select @ItemsInStock = QuantityAvailable from tblProduct where ProductId=1;

	-- Transaction takes 10 seconds
	Waitfor Delay '00:00:10'; 
	Set @ItemsInStock = @ItemsInStock - 1;

	Update tblProduct Set QuantityAvailable = @ItemsInStock where ProductId=1;

	Print @ItemsInStock;
Commit Transaction;


-- Transaction 2
Begin Tran
	Declare @ItemsInStock int

	Select @ItemsInStock = QuantityAvailable from tblProduct where ProductId=1;

	-- Transaction takes 1 second
	Waitfor Delay '00:00:1';
	Set @ItemsInStock = @ItemsInStock - 2;

	Update tblProduct Set QuantityAvailable = @ItemsInStock where ProductId=1;

	Print @ItemsInStock;
Commit Transaction;