-- Transaction 1
BEGIN TRAN
UPDATE tblPersonA SET Gender = 'Female' WHERE Id = 1;
UPDATE tblPersonB SET Gender = 'Female' WHERE Id = 1; -- Blocked until database engine solved deadlock in transaction 2.
COMMIT TRANSACTION

-- Transaction 2
BEGIN TRAN
UPDATE tblPersonB SET Gender = 'Male' WHERE Id = 1;
UPDATE tblPersonA SET Gender = 'Male' WHERE Id = 1; -- ERROR - Transaction (Process ID 58) was deadlocked on lock resources with another process and has been chosen as the deadlock victim. Rerun the transaction.
COMMIT TRANSACTION

Select * FROM tblPersonA WHERE Id = 1; -- 'Female'
Select * FROM tblPersonB WHERE Id = 1; -- 'Female'