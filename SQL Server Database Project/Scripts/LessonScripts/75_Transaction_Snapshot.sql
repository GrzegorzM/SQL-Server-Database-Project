-- Transaction 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRANSACTION;
UPDATE tblProduct SET QuantityAvailable = 75 WHERE ProductId = 1;
COMMIT TRANSACTION;
-- Transaction 2
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRANSACTION;
SELECT QuantityAvailable FROM tblProduct WHERE ProductId = 1; -- Blocked.
COMMIT TRANSACTION;


ALTER DATABASE Sample SET ALLOW_SNAPSHOT_ISOLATION ON;
-- Transaction 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRANSACTION;
UPDATE tblProduct SET QuantityAvailable = 74 WHERE ProductId = 1;
COMMIT TRANSACTION;
-- Transaction 2
SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
BEGIN TRANSACTION;
SELECT QuantityAvailable FROM tblProduct WHERE ProductId = 1; -- Returns the "old" value from a temporary table.
COMMIT TRANSACTION;


-- Transaction 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN TRANSACTION;
UPDATE tblProduct SET QuantityAvailable = 75 WHERE ProductId = 1;
COMMIT TRANSACTION;
-- Transaction 2
SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
BEGIN TRANSACTION;
UPDATE tblProduct SET QuantityAvailable = 76 WHERE ProductId = 1; -- Blocked when transaction 1 is uncommitted and returns an error after committing the first transaction. Cannot override update(lost update) while another transaction is updated.
COMMIT TRANSACTION;