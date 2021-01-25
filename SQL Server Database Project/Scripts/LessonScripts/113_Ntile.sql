SELECT Name, Gender, Salary, NTILE(2) OVER (ORDER BY Salary) AS [NTILE] FROM tblEmployee;
SELECT Name, Gender, Salary, NTILE(4) OVER (ORDER BY Salary) AS [NTILE] FROM tblEmployee;

SELECT Name, Gender, Salary, NTILE(2) OVER (PARTITION BY Gender ORDER BY Salary) AS [NTILE] FROM tblEmployee;
SELECT Name, Gender, Salary, NTILE(4) OVER (PARTITION BY Gender ORDER BY Salary) AS [NTILE] FROM tblEmployee;