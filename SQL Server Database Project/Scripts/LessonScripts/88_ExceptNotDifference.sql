SELECT * FROM tblPersonA;
SELECT * FROM tblPersonB;
INSERT INTO tblPersonA VALUES('Kamala', 'Female');
INSERT INTO tblPersonB VALUES('Kamala', 'Male');

-- Except operator filters the duplicates using all specified columns("Kamala Female" != "Kamala Male"). Compares exactly the same number of columns from tableA and tableB.
SELECT Name, Gender FROM tblPersonA
EXCEPT
SELECT Name, Gender FROM tblPersonB;

SELECT Name FROM tblPersonA -- Error - EXCEPT operator must have an equal number of expressions
EXCEPT
SELECT Name, Gender FROM tblPersonB;

-- Not operator will not filter duplicates based on all columns specified. Compares a single column in tableA with a single column in a subquery(TableB).
SELECT Name, Gender FROM tblPersonA WHERE Name
NOT IN(SELECT Name FROM tblPersonB);

SELECT Name, Gender FROM tblPersonA WHERE Name -- Error - Only one expression can be specified in the select list when the subquery is not introduced with EXISTS.
NOT IN(SELECT Name, Gender FROM tblPersonB);