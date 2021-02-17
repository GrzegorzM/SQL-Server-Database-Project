EXECUTE sp_depends 'tblEmployee';
EXECUTE sp_depends 'spGetEmployees';

CREATE TABLE tblEmployeeTest
(
 Id INT PRIMARY KEY IDENTITY,
 Name NVARCHAR(50),
 Gender NVARCHAR(10)
);

CREATE PROCEDURE spGetEmployeesTest
AS
BEGIN
 SELECT * FROM tblEmployeeTest;
END;

EXECUTE sp_depends 'tblEmployeeTest';
EXECUTE sp_depends 'spGetEmployeesTest';

-- Sometimes sp_depends does not report dependencies correctly. 
-- For example, there is currently a tblEmployeeTest table and a sp_GetEmployees stored procedure. Unexpected results are returned when the table is dropped and then recreated. 

DROP TABLE tblEmployeeTest;
CREATE TABLE tblEmployeeTest
(
 Id INT PRIMARY KEY IDENTITY,
 Name NVARCHAR(50),
 Gender NVARCHAR(10)
);

-- Not working as expected.
EXECUTE sp_depends 'tblEmployeeTest'; -- Object does not reference any object, and no objects reference it.
EXECUTE sp_depends 'spGetEmployeesTest'; -- Object does not reference any object, and no objects reference it.