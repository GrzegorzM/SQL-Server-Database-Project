DECLARE @Gender INT;
SET @Gender = 1;
SELECT IIF( @Gender = 1, 'Male', 'Female') AS Gender;

-- Using CASE statement
SELECT Name, Salary, 
    CASE WHEN Salary >= 4500
      THEN 'High Salary'
      ELSE 'Low Salary'
    END AS SalaryDescription
FROM tblEmployee;

-- Using IIF function
SELECT Name, Salary, IIF(Salary >= 4500, 'High Salary', 'Low Salary') AS SalaryDescription FROM tblEmployee;