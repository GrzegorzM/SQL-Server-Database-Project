SELECT Name, Gender, Salary, FIRST_VALUE(Name) OVER (ORDER BY Salary) AS [FIRST_VALUE] FROM tblEmployee;
SELECT Name, Gender, Salary, FIRST_VALUE(Name) OVER (PARTITION BY Gender ORDER BY Salary) AS [FIRST_VALUE] FROM tblEmployee;
-- FIRST_VALUE function - Retrieves the first value from the specified column, ORDER BY clause is required.