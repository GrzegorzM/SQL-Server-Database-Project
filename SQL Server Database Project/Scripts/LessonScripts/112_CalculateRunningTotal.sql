SELECT Name, Gender, Salary, SUM(Salary) OVER (ORDER BY ID) AS RunningTotal FROM tblEmployee;

SELECT Name, Gender, Salary, SUM(Salary) OVER (PARTITION BY Gender ORDER BY ID) AS RunningTotal FROM tblEmployee;

-- Using a column with duplicate values(Gender) in the ORDER BY clause causes all duplicate values to be added to the running total at once.
SELECT Name, Gender, Salary, SUM(Salary) OVER (ORDER BY Gender) AS RunningTotal FROM tblEmployee;