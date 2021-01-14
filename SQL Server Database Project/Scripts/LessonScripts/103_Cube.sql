-- Using Cube with Group By
SELECT Country, Gender, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries
GROUP BY Cube(Country, Gender);
--OR
SELECT Country, Gender, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries
GROUP BY Country, Gender with Cube;

-- The above query is equivalent to the following Grouping Sets query
SELECT Country, Gender, SUM(Salary) AS TotalSalary
FROM tblEmployeeCountries
GROUP BY GROUPING SETS
(
  (Country, Gender),
  (Country),
  (Gender),
  ()
);

-- The above query is equivalent to the following UNION ALL query. While the data in the result set is the same, the ordering is not. Use ORDER BY to control the ordering of rows in the result set.
SELECT Country, Gender, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries
GROUP BY Country, Gender
UNION ALL
SELECT Country, NULL, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries
GROUP BY Country
UNION ALL
SELECT NULL, Gender, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries
GROUP BY Gender
UNION ALL
SELECT NULL, NULL, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries;
