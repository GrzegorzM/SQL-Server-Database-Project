SELECT * FROM tblPersonA;
SELECT * FROM tblPersonB;

INSERT tblPersonA VALUES('Sara', 'Female'); -- Inserts a duplicate TableA row.
INSERT tblPersonB VALUES('Sara', 'Female'); -- Inserts a duplicate TableB row.

SELECT Name, Gender FROM tblPersonA
INTERSECT
SELECT Name, Gender FROM tblPersonB;

SELECT * FROM tblPersonA -- Does not works as expected. Always empty as the value in the Id column is not the same. 
INTERSECT
SELECT * FROM tblPersonB;

SELECT a.Name, a.Gender FROM tblPersonA a -- Only works as expected if the rows have the same ID value.
INNER JOIN tblPersonB b ON a.Id = b.Id; -- Returns Sara records twice.

SELECT DISTINCT a.Name, a.Gender FROM tblPersonA a -- Returns Sara record once.
INNER JOIN tblPersonB b ON a.Id = b.Id;

-- Intersect operator retrieves the common records from both the left and the right query of the Intersect operator.
--The number and the order of the columns must be same in both the queries. The data types must be same or at least compatible.