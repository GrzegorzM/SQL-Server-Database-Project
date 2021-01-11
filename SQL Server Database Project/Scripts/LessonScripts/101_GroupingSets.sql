Select * from tblEmployeeCountries;

SELECT Country, Gender, SUM(Salary) as TotalSalary FROM tblEmployeeCountries
GROUP BY Country, Gender;

SELECT Country, Gender, SUM(Salary) as TotalSalary FROM tblEmployeeCountries
GROUP BY Country, Gender
UNION ALL
SELECT Country, NULL, SUM(Salary) as TotalSalary FROM tblEmployeeCountries
GROUP BY Country;

SELECT Country, Gender, SUM(Salary) as TotalSalary FROM tblEmployeeCountries
GROUP BY Country, Gender
UNION ALL
SELECT Country, NULL, SUM(Salary) as TotalSalary FROM tblEmployeeCountries
GROUP BY Country
UNION ALL
SELECT NULL, Gender, SUM(Salary) as TotalSalary FROM tblEmployeeCountries
GROUP BY Gender;

SELECT Country, Gender, SUM(Salary) as TotalSalary FROM tblEmployeeCountries
GROUP BY Country, Gender
UNION ALL
SELECT Country, NULL, SUM(Salary) as TotalSalary FROM tblEmployeeCountries
GROUP BY Country
UNION ALL
SELECT NULL, Gender, SUM(Salary) as TotalSalary FROM tblEmployeeCountries
GROUP BY Gender
UNION ALL
SELECT NULL, NULL, SUM(Salary) as TotalSalary FROM tblEmployeeCountries;

SELECT Country, Gender, SUM(Salary) as TotalSalary FROM tblEmployeeCountries
GROUP BY GROUPING SETS( 
	(Country, Gender),
	(Country),
	(Gender),
	()
);

SELECT Country, Gender, SUM(Salary) as TotalSalary FROM tblEmployeeCountries
GROUP BY GROUPING SETS( 
	(Country, Gender),
	(Country),
	(Gender),
	()
) ORDER BY GROUPING(Country), GROUPING(Gender), Gender;