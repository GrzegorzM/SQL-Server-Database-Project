Select Name, Gender, Salary, ROW_NUMBER() OVER (ORDER BY Gender) AS RowNumber from tblEmployee;
Select Name, Gender, Salary, ROW_NUMBER() OVER (ORDER BY Email) AS RowNumber from tblEmployee;
Select Name, Gender, Salary, ROW_NUMBER() OVER (ORDER BY Email) AS RowNumber from tblEmployee ORDER BY Name;
Select Name, Gender, Salary, ROW_NUMBER() OVER () AS RowNumber from tblEmployee; -- ERROR - The function 'ROW_NUMBER' must have an OVER clause with ORDER BY.

Select Name, Gender, Salary, ROW_NUMBER() OVER (PARTITION BY Gender ORDER BY Gender) AS RowNumber from tblEmployee;

-- Use case - Deletes duplicate rows based on the Id column.
WITH EmployeeCTE AS
(
	SELECT *, ROW_NUMBER() OVER (PARTITION BY Id ORDER BY Id) AS RowNumber FROM tblEmployeeDuplicates
)
DELETE FROM EmployeeCTE WHERE RowNumber > 1;