SELECT * FROM tblPersonA;
SELECT * FROM tblPersonB;

-- Except operator on multiple tables.
SELECT * FROM tblPersonA -- Not working as intended different Id for same records dont allow to remove records presented in table B.
EXCEPT
SELECT * FROM tblPersonB;

SELECT Name, Gender FROM tblPersonA -- Excluding Id column from the list enable to remove records presented in table B.
EXCEPT
SELECT Name, Gender FROM tblPersonB;

SELECT Gender, Name FROM tblPersonA -- Not working as intended wrong order of columns.
EXCEPT
SELECT Name, Gender FROM tblPersonB;

SELECT Gender FROM tblPersonA -- Incorrect number of columns must be the same.
EXCEPT
SELECT Name, Gender FROM tblPersonB;

SELECT Name, Gender FROM tblPersonB -- Reverse tables to get rows presented in table B and exclude rows from table A.
EXCEPT
SELECT Name, Gender FROM tblPersonA;

-- Except operator on single table.
SELECT Name, Gender, Salary FROM tblEmployee WHERE Salary >= 4000
EXCEPT
SELECT Name, Gender, Salary FROM tblEmployee WHERE Salary >= 6000;

-- Except operator on single table with order by. Order by after secound query.
SELECT Name, Gender, Salary FROM tblEmployee WHERE Salary >= 4000
ORDER BY Name -- Error - Order by only after the second query.
EXCEPT
SELECT Name, Gender, Salary FROM tblEmployee WHERE Salary >= 6000;

SELECT Name, Gender, Salary FROM tblEmployee WHERE Salary >= 4000
EXCEPT
SELECT Name, Gender, Salary FROM tblEmployee WHERE Salary >= 6000
ORDER BY Name;