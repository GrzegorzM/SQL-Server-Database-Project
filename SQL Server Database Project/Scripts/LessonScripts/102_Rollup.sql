SELECT Country, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries
GROUP BY ROLLUP(Country);

-- The above query can also be rewritten as shown below
SELECT Country, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries
GROUP BY Country WITH ROLLUP;

-- Using UNION ALL operator along with GROUP BY
SELECT Country, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries
GROUP BY Country
UNION ALL
SELECT NULL, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries;

-- Using Grouping Sets to achieve the same result
SELECT Country, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries
GROUP BY GROUPING SETS
(
    (Country),
    ()
);

-- Using ROLLUP with GROUP BY
SELECT Country, Gender, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries
GROUP BY ROLLUP(Country, Gender);
-- OR
SELECT Country, Gender, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries
GROUP BY Country, Gender WITH ROLLUP;

-- Using UNION ALL with GROUP BY
SELECT Country, Gender, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries
GROUP BY Country, Gender
UNION ALL
SELECT Country, NULL, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries
GROUP BY Country
UNION ALL
SELECT NULL, NULL, SUM(Salary) AS TotalSalary
FROM tblEmployeeCountries;

-- Using GROUPING SETS
SELECT Country, Gender, SUM(Salary) AS TotalSalary FROM tblEmployeeCountries
GROUP BY GROUPING SETS
(
    (Country, Gender),
    (Country),
    ()
);