SELECT Name, Gender from tblPersonA;
SELECT Name, Gender from tblPersonB;

SELECT Name, Gender from tblPersonA -- Common rows from both tables without duplicates.
UNION
SELECT Name, Gender from tblPersonB;

SELECT Name, Gender from tblPersonA -- Common rows from both tables with duplicates.
UNION ALL
SELECT Name, Gender from tblPersonB;

SELECT Name, Gender from tblPersonA -- Returns duplicated rows.
INTERSECT
SELECT Name, Gender from tblPersonB;

SELECT Name, Gender from tblPersonA -- Returns the table data except for rows that also exist in the table.
EXCEPT
SELECT Name, Gender from tblPersonB;

-- Error - All queries combined using a UNION, INTERSECT or EXCEPT operator must have an equal number of expressions in their target lists.
SELECT Name from tblPersonA
EXCEPT
SELECT Name, Gender from tblPersonB;