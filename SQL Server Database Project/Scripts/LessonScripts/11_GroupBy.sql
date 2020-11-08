Select Sum(Salary) from tblEmployee;
Select Min(Salary) from tblEmployee;
Select Max(Salary) from tblEmployee;
Select City, Sum(Salary) as TotalSalary from tblEmployee
Group by City;
Select City, Gender, Sum(Salary) as TotalSalary from tblEmployee
Group by City, Gender order by City;
Select City, Gender, Sum(Salary) as TotalSalary, Count(Id) as [Total Employees] from tblEmployee
Group by City, Gender order by City;
Select City, Gender, Sum(Salary) as TotalSalary, Count(Id) as [Total Employees] from tblEmployee where Gender = 'Male'
Group by City, Gender order by City;
Select City, Gender, Sum(Salary) as TotalSalary, Count(Id) as [Total Employees] from tblEmployee
Group by City, Gender having Gender = 'Male' order by City;
Select * from tblEmployee Where Sum(Salary) > 4000; -- Error, Agregate functions cannot be used in the where clause(exception - subqueries).
Select City from tblEmployee Group by City Having Sum(Salary) > 4000;