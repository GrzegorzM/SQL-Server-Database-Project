ALTER TABLE tblEmployeeIndexes
ADD CONSTRAINT UQ_tblEmployeeIndexes_City UNIQUE (City); -- Creating a UNIQUE constraint, actually creates a UNIQUE index.

ALTER TABLE tblEmployeeIndexes
ADD CONSTRAINT UQ_tblEmployeeIndexes_City UNIQUE CLUSTERED (City);

CREATE UNIQUE NONCLUSTERED INDEX UIN_tblEmployeeIndexes
ON tblEmployeeIndexes (FirstName, LastName);

CREATE UNIQUE INDEX IX_tblEmployeeIndexes_City -- If we try to insert 10 rows, out of which 5 rows contain duplicates, then all the 10 rows are rejected. However, if we want only the 5 duplicate rows to be rejected and accept the non-duplicate 5 rows, then we can use IGNORE_DUP_KEY option.
ON tblEmployeeIndexes(City) WITH IGNORE_DUP_KEY