CREATE TYPE EmployeeTableType AS TABLE
(
  Id INT PRIMARY KEY IDENTITY(1, 1),
  Name NVARCHAR(50) NOT NULL,
  Gender NVARCHAR(10) NOT NULL,
	DeptID INT,
	EMAIL NVARCHAR(50),
	DateOfBirth DATETIME,
	Salary INT
);
DROP TYPE EmployeeTableType;
DROP PROCEDURE spInsertEmployees;

CREATE PROCEDURE spInsertEmployees
  @EmployeeTableType EmployeeTableType READONLY
AS
BEGIN
    INSERT INTO tblEmployee
    SELECT Name, Gender, DeptID, EMAIL, DateOfBirth, Salary FROM @EmployeeTableType
END;

DECLARE @EmployeeTableType EmployeeTableType;

INSERT INTO @EmployeeTableType VALUES ('Mark', 'Male', 1, NULL, NULL, 2303);
INSERT INTO @EmployeeTableType VALUES ('Mary', 'Female', 3, NULL, GETDATE(), 4503);
INSERT INTO @EmployeeTableType VALUES ('John', 'Male', 1, NULL, NULL, 2234);
INSERT INTO @EmployeeTableType VALUES ('Sara', 'Female', 3, NULL, NULL, 7403);
INSERT INTO @EmployeeTableType VALUES ('Rob', 'Male', 2, NULL, GETDATE(), 3403);

EXECUTE spInsertEmployees @EmployeeTableType;
SELECT * FROM tblEmployee;