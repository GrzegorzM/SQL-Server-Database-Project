-- There are different categories of window functions in SQL Server. 
-- Aggregate functions - AVG, SUM, COUNT, MIN, MAX etc..
-- Ranking functions - RANK, DENSE_RANK, ROW_NUMBER etc..
-- Analytic functions - LEAD, LAG, FIRST_VALUE, LAST_VALUE etc...
SELECT AVG(Salary) FROM tblEmployee;
SELECT Name, Gender, Salary,
	AVG(Salary) OVER (ORDER BY Salary) AS [Average],
	COUNT(Salary) OVER (ORDER BY Salary) AS [Count],
	SUM(Salary) OVER (ORDER BY Salary) AS [Sum] FROM tblEmployee;

SELECT Name, Gender, Salary,
	AVG(Salary) OVER (PARTITION BY Gender ORDER BY Salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS [Average],
	COUNT(Salary) OVER (PARTITION BY Gender ORDER BY Salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS [Count],
	SUM(Salary) OVER (PARTITION BY Gender ORDER BY Salary ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS [Sum] FROM tblEmployee;

SELECT Name, Gender, Salary,
	AVG(Salary) OVER (ORDER BY Salary ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS [Average],
	COUNT(Salary) OVER (ORDER BY Salary ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS [Count],
	SUM(Salary) OVER (ORDER BY Salary ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS [Sum] FROM tblEmployee;