-- All statements below produce same results if there is not duplicates.
SELECT Name, Salary, SUM(Salary) OVER (ORDER BY Salary) AS RunningTotal FROM tblEmployee;
SELECT Name, Salary, SUM(Salary) OVER (ORDER BY Salary RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal FROM tblEmployee;
SELECT Name, Salary, SUM(Salary) OVER (ORDER BY Salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal FROM tblEmployee;

-- The main difference between ROWS and RANGE is in the way duplicate rows are treated. ROWS treat duplicates as distinct values, where as RANGE treats them as a single entity.
SELECT Name, Salary, 
	SUM(Salary) OVER (ORDER BY Salary) AS [Default],
	SUM(Salary) OVER (ORDER BY Salary RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS [RANGE],
	SUM(Salary) OVER (ORDER BY Salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS [ROWS]
FROM tblEmployee;