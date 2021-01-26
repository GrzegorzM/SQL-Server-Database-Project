SELECT Name, Gender, Salary, LEAD(Salary) OVER (ORDER BY Salary) AS [LEAD] FROM tblEmployee;
SELECT Name, Gender, Salary, LEAD(Salary, 2) OVER (ORDER BY Salary) AS [LEAD] FROM tblEmployee;
SELECT Name, Gender, Salary, LEAD(Salary, 2, -1) OVER (ORDER BY Salary) AS [LEAD] FROM tblEmployee;
SELECT Name, Gender, Salary, LEAD(Salary, 2, -1) OVER (PARTITION BY Gender ORDER BY Salary) AS [LEAD] FROM tblEmployee;

SELECT Name, Gender, Salary, LAG(Salary) OVER (ORDER BY Salary) AS [LAG] FROM tblEmployee;
SELECT Name, Gender, Salary, LAG(Salary, 2) OVER (ORDER BY Salary) AS [LAG] FROM tblEmployee;
SELECT Name, Gender, Salary, LAG(Salary, 2, -1) OVER (ORDER BY Salary) AS [LAG] FROM tblEmployee;
SELECT Name, Gender, Salary, LAG(Salary, 2, -1) OVER (PARTITION BY Gender ORDER BY Salary) AS [LAG] FROM tblEmployee;