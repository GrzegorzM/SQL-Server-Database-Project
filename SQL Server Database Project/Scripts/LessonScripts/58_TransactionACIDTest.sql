﻿-- A successful transaction must pass the "ACID" test, that is a transaction must be Atomic, Consistent, Isolated and Durable.
--Atomic - Whole transaction is treated as one statement. All tasks must succeed or be rollbacked.
--Consistent - Logically consistent, when we already reduce available quantity of product in one table but unable to save performed operations to another table then those 2 tables are inconsistent.
--Isolated - Locking mechanism, block access to changed rows when transaction not commited/rollbacked.
--Durable - Be able to rollback changes after error occurs.