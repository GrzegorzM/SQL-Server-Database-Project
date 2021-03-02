-- Transaction 1
BEGIN TRAN
UPDATE tblPersonA SET Name = Name + ' Transaction 1' WHERE Id = 1;
UPDATE tblPersonB SET Name = Name + ' Transaction 1' WHERE Id IN (1, 2, 3, 4, 5); -- ERROR - Transaction (Process ID 56) was deadlocked on lock resources with another process and has been chosen as the deadlock victim. Rerun the transaction.
COMMIT TRANSACTION
-- Transaction 2
BEGIN TRAN
UPDATE tblPersonB SET Name = Name + ' Transaction 2' WHERE Id IN (1, 2, 3, 4, 5);
UPDATE tblPersonA SET Name = Name + ' Transaction 2' WHERE Id = 1; -- Committed successfully(Less records to update - only one row compared to five rows in transaction 1).
COMMIT TRANSACTION

Select * FROM tblPersonA;
Select * FROM tblPersonB;

-- Transaction 1
BEGIN TRAN
UPDATE tblPersonB SET Name = Name + ' Transaction 1' WHERE Id IN (1, 2, 3, 4, 5);
UPDATE tblPersonA SET Name = Name + ' Transaction 1' WHERE Id = 1; -- Committed successfully(Less records to update - only one row compared to five rows in transaction 2).
COMMIT TRANSACTION
-- Transaction 2
BEGIN TRAN
UPDATE tblPersonA SET Name = Name + ' Transaction 2' WHERE Id = 1;
UPDATE tblPersonB SET Name = Name + ' Transaction 2' WHERE Id IN (1, 2, 3, 4, 5); -- ERROR - Transaction (Process ID 55) was deadlocked on lock resources with another process and has been chosen as the deadlock victim. Rerun the transaction.
COMMIT TRANSACTION

-- Transaction 1
BEGIN TRAN -- Default deadlock priority - normal.
UPDATE tblPersonB SET Name = Name + ' Transaction 1' WHERE Id IN (1, 2, 3, 4, 5);
UPDATE tblPersonA SET Name = Name + ' Transaction 1' WHERE Id = 1; -- Transaction (Process ID 56) was deadlocked on lock resources with another process and has been chosen as the deadlock victim. Rerun the transaction.
COMMIT TRANSACTION
-- Transaction 2
SET DEADLOCK_PRIORITY HIGH;
BEGIN TRAN
UPDATE tblPersonA SET Name = Name + ' Transaction 2' WHERE Id = 1;
UPDATE tblPersonB SET Name = Name + ' Transaction 2' WHERE Id IN (1, 2, 3, 4, 5); -- Committed successfully(Higher transaction priority).
COMMIT TRANSACTION