-- Transaction 1
BEGIN TRANSACTION
SELECT * FROM tblEmployee WHERE Salary > 10000; -- NULL
WAITFOR DELAY '00:00:10';
SELECT * FROM tblEmployee WHERE Salary > 10000; -- Mark
COMMIT TRANSACTION;
-- Transaction 2
INSERT INTO tblEmployee VALUES('Mark', 'Male', 1, 'Mark@mail.com', GETDATE(), 12000); -- Added immediately;

-- Transaction 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
SELECT * FROM tblEmployee WHERE Salary > 10000; -- Mark
WAITFOR DELAY '00:00:10';
SELECT * FROM tblEmployee WHERE Salary > 10000; -- Mark
COMMIT TRANSACTION;
-- Transaction 2
INSERT INTO tblEmployee VALUES('Emma', 'Female', 1, 'Emma@mail.com', GETDATE(), 11000); -- The table is locked, inserting will wait for the transaction to be committed.

-- Transaction 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
SELECT * FROM tblEmployee WHERE Salary > 10000; -- Mark
WAITFOR DELAY '00:00:10';
SELECT * FROM tblEmployee WHERE Salary > 10000; -- Mark
COMMIT TRANSACTION;
-- Transaction 2
INSERT INTO tblEmployee VALUES('Eric', 'Male', 1, 'Eric@mail.com', GETDATE(), 4000); -- Does not affect the result of the select statement in the transaction(Salary < 10000). Table is locked, insert gonna wait till transaction commit.

-- Transaction 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION
SELECT * FROM tblEmployee WHERE Id BETWEEN 1 AND 3;
WAITFOR DELAY '00:00:10';
SELECT * FROM tblEmployee WHERE Id BETWEEN 1 AND 3;
COMMIT TRANSACTION;
-- Transaction 2
INSERT INTO tblEmployee VALUES('Anna', 'Female', 1, 'Anna@mail.com', GETDATE(), 14000); -- Does not affect the result of the select statement in the transaction(Id > 3). Only rows with Id between 1 and 3 will be locked. The new record has a higher Id number then the range specified in the select statement, so it will be added immediately.

-- Setting transaction isolation level of Transaction 1 to serializable will place a range lock on the rows with salary higher then 1000, which prevents any other transaction from inserting new rows with in that range. This solves the phantom read problem. 

-- Serializable prevents both non-repeatable read and phantom read problems. 
-- Serializable isolation level ensures that the data that one transaction has read, will be prevented from being updated or deleted by any other transaction.
-- It also prevents new rows from being inserted by other transactions, so this isolation level prevents both non-repeatable read and phantom read problems.