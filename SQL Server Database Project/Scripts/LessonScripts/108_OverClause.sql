select * from tblEmployee;

SELECT Gender, COUNT(Id) AS GenderTotal, AVG(Salary) AS AVGSALARY, MIN(Salary) AS MINSALARY, MAX(Salary) AS MaxSalary
FROM tblEmployee GROUP BY Gender;

SELECT NAME, Salary, Gender, COUNT(Id) AS GenderTotal, AVG(Salary) AS AVGSALARY, MIN(Salary) AS MINSALARY, MAX(Salary) AS MaxSalary
FROM tblEmployee GROUP BY Gender; -- ERROR - Column 'tblEmployee.Name' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.

-- Using 'Inner Join' with subquery and 'GROUP BY'.
SELECT Name, Salary, E.Gender, Genders.GenderTotal, Genders.AvgSalary, Genders.MinSalary, Genders.MaxSalary FROM tblEmployee E
INNER JOIN
(SELECT Gender, COUNT(Id) AS GenderTotal, AVG(Salary) AS AvgSalary, MIN(Salary) AS MinSalary, MAX(Salary) AS MaxSalary
FROM tblEmployee GROUP BY Gender) AS Genders 
ON E.Gender = Genders.Gender;

-- Using Over Clause.
SELECT NAME, SALARY, Gender, 
	COUNT(Id) OVER(PARTITION BY Gender) AS GenderTotal, 
	AVG(Salary) OVER(PARTITION BY Gender) AS AvgSalary, 
	MIN(Salary) OVER(PARTITION BY Gender) AS MinSalary, 
	MAX(Salary) OVER(PARTITION BY Gender) AS MaxSalary
FROM tblEmployee;

-- Using Over Clause with no partition is a valid syntax.
SELECT NAME, SALARY, Gender, 
	COUNT(Id) OVER() AS GenderTotal,
	AVG(Salary) OVER() AS AvgSalary, -- Returns the average salary across all records.
	MIN(Salary) OVER(PARTITION BY Gender) AS MinSalary, -- It returns the minimum salary by gender(Calculated separately for male and female).
	MAX(Salary) OVER(PARTITION BY Gender) AS MaxSalary
FROM tblEmployee;