SELECT * FROM tblProduct;

-- Transaction 1
BEGIN TRANSACTION
	SELECT QuantityAvailable FROM tblProduct WHERE ProductId = 1; -- Old Value
	WAITFOR DELAY '00:00:10';
	SELECT QuantityAvailable FROM tblProduct WHERE ProductId = 1; -- New Value(74)
COMMIT TRANSACTION
-- Transaction 2
UPDATE tblProduct SET QuantityAvailable = 74 WHERE ProductId = 1;


-- Transaction 1
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN TRANSACTION
	SELECT QuantityAvailable FROM tblProduct WHERE ProductId = 1; -- Old Value
	WAITFOR DELAY '00:00:10';
	SELECT QuantityAvailable FROM tblProduct WHERE ProductId = 1; -- Old Value
COMMIT TRANSACTION
-- Transaction 2
UPDATE tblProduct SET QuantityAvailable = 74 WHERE ProductId = 1; -- Update only after completing the transaction. 
