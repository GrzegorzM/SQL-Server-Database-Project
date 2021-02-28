ALTER DATABASE Sample SET ALLOW_SNAPSHOT_ISOLATION ON;
-- Transaction 1
SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
BEGIN TRANSACTION;
UPDATE tblProduct SET QuantityAvailable = 74 WHERE ProductId = 1;
COMMIT TRANSACTION;
-- Transaction 2
SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
BEGIN TRANSACTION;
UPDATE tblProduct SET QuantityAvailable = 75 WHERE ProductId = 1; -- blocked until commit and after raise error - Snapshot isolation transaction aborted due to update conflict.
COMMIT TRANSACTION;

SELECT * FROM  tblProduct WHERE ProductId = 1;

ALTER DATABASE Sample SET ALLOW_SNAPSHOT_ISOLATION OFF;
ALTER DATABASE Sample SET READ_COMMITTED_SNAPSHOT ON; -- Blocked till all other connections(windows in Management Studio) are opened.
-- Transaction 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
UPDATE tblProduct SET QuantityAvailable = 74 WHERE ProductId = 1;
COMMIT TRANSACTION;
-- Transaction 2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
UPDATE tblProduct SET QuantityAvailable = 75 WHERE ProductId = 1; -- blocked until commit.
COMMIT TRANSACTION;

SELECT * FROM  tblProduct WHERE ProductId = 1;


-- Transaction 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
UPDATE tblProduct SET QuantityAvailable = 74 WHERE ProductId = 1;
COMMIT TRANSACTION;
-- Transaction 2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; -- STATEMENT LEVEL READ CONSISTENCY
BEGIN TRANSACTION;
SELECT QuantityAvailable FROM tblProduct WHERE ProductId = 1; -- 75 (old value).
-- AFTER COMMITTED TRANSACTION 1
SELECT QuantityAvailable FROM tblProduct WHERE ProductId = 1; -- 74 (new committed value).
COMMIT TRANSACTION;

-- Transaction 1
SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
BEGIN TRANSACTION;
UPDATE tblProduct SET QuantityAvailable = 74 WHERE ProductId = 1;
COMMIT TRANSACTION;
-- Transaction 2
SET TRANSACTION ISOLATION LEVEL SNAPSHOT; -- TRANSACTION LEVEL READ CONSISTENCY
BEGIN TRANSACTION;
SELECT QuantityAvailable FROM tblProduct WHERE ProductId = 1; -- 75 (old value).
-- AFTER COMMITTED TRANSACTION 1
SELECT QuantityAvailable FROM tblProduct WHERE ProductId = 1; -- 75 (old value).
COMMIT TRANSACTION;
SELECT * FROM  tblProduct WHERE ProductId = 1; -- 74 - New value only after committing transaction 2.