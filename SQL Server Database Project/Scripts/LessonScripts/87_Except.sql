SELECT * FROM tblPersonA;
SELECT * FROM tblPersonB;

-- Except operator on multiple tables.
SELECT * FROM tblPersonA -- Does not work as intended. A different Id for the same records does not allow to delete the records shown in table B.
EXCEPT
SELECT * FROM tblPersonB;

SELECT Name, Gender FROM tblPersonA -- Remove the Id column from the list to get rows shown in table A and exclude the records from table B.
EXCEPT
SELECT Name, Gender FROM tblPersonB;

SELECT Gender, Name FROM tblPersonA -- Does not work as intended wrong order of columns.
EXCEPT
SELECT Name, Gender FROM tblPersonB;

SELECT Gender FROM tblPersonA -- Error - Invalid number of columns - must have an equal number.
EXCEPT
SELECT Name, Gender FROM tblPersonB;

SELECT Name, Gender FROM tblPersonB -- Reverse the tables to get the rows shown in table B and exclude the rows from table A.
EXCEPT
SELECT Name, Gender FROM tblPersonA;

-- Except operator on a single table.
SELECT Name, Gender, Salary FROM tblEmployee WHERE Salary >= 4000
EXCEPT
SELECT Name, Gender, Salary FROM tblEmployee WHERE Salary >= 6000;

-- Except operator on single a table with order by clause. Order by after second query.
SELECT Name, Gender, Salary FROM tblEmployee WHERE Salary >= 4000
ORDER BY Name -- Error - order by only after second query.
EXCEPT
SELECT Name, Gender, Salary FROM tblEmployee WHERE Salary >= 6000;

SELECT Name, Gender, Salary FROM tblEmployee WHERE Salary >= 4000
EXCEPT
SELECT Name, Gender, Salary FROM tblEmployee WHERE Salary >= 6000
ORDER BY Name DESC;