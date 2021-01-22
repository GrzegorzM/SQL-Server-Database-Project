UPDATE tblEmployee SET Salary = 4000 WHERE Id IN(5, 6);
SELECT * FROM tblEmployee;

-- ORDER BY is required.
SELECT *, 
	RANK() OVER (ORDER BY Salary DESC) AS [RANK], 
	DENSE_RANK() OVER (ORDER BY Salary DESC) AS [DENSE_RANK] 
FROM tblEmployee;

SELECT *, 
	RANK() OVER (PARTITION BY GENDER ORDER BY Salary DESC) AS [RANK], 
	DENSE_RANK() OVER (PARTITION BY GENDER ORDER BY Salary DESC) AS [DENSE_RANK] 
FROM tblEmployee;

UPDATE tblEmployee SET Salary = 10000 WHERE Id IN(5, 6);
WITH RESULT AS
(
	SELECT Salary, 
		RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
	FROM tblEmployee
)
SELECT TOP 1 Salary FROM RESULT WHERE SalaryRank = 1;
SELECT TOP 1 Salary FROM RESULT WHERE SalaryRank = 2; -- Empty result, if there is a tie on the highest salary, the second salary is empty.

WITH RESULT AS
(
	SELECT Salary, 
		DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
	FROM tblEmployee
)
SELECT TOP 1 Salary FROM RESULT WHERE SalaryRank = 2;

WITH RESULT AS
(
	SELECT Salary, Gender, 
		DENSE_RANK() OVER (PARTITION BY Gender ORDER BY Salary DESC) AS SalaryRank
	FROM tblEmployee
)
SELECT TOP 1 Salary, Gender FROM RESULT WHERE SalaryRank = 2 AND Gender = 'Female'; -- Second highest salary for female.