-- Transaction 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
UPDATE tblProduct SET QuantityAvailable = 75 WHERE ProductId = 1;
COMMIT TRANSACTION;
-- Transaction 2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
SELECT QuantityAvailable FROM tblProduct WHERE ProductId = 1; -- Blocked till commit.
COMMIT TRANSACTION;


-- Transaction 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
UPDATE tblProduct SET QuantityAvailable = 75 WHERE ProductId = 1;
COMMIT TRANSACTION;
-- Transaction 2
ALTER DATABASE Sample SET READ_COMMITTED_SNAPSHOT ON; -- Blocked till all connections(windows in Management Studio) are closed.
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRANSACTION;
SELECT QuantityAvailable FROM tblProduct WHERE ProductId = 1; -- Not blocked, returns the last committed  data - old data.
COMMIT TRANSACTION;

-- Same results as above but using a snapshot.
ALTER DATABASE Sample SET READ_COMMITTED_SNAPSHOT OFF; -- Blocked till all connections(windows in Management Studio) are closed.
-- Transaction 1
SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
BEGIN TRANSACTION;
UPDATE tblProduct SET QuantityAvailable = 75 WHERE ProductId = 1;
COMMIT TRANSACTION;
-- Transaction 2
ALTER DATABASE Sample SET ALLOW_SNAPSHOT_ISOLATION ON; -- Blocked till all connections(windows in Management Studio) are closed.
SET TRANSACTION ISOLATION LEVEL SNAPSHOT;
BEGIN TRANSACTION;
SELECT QuantityAvailable FROM tblProduct WHERE ProductId = 1; -- Not blocked, returns the last committed  data - old data.
COMMIT TRANSACTION;