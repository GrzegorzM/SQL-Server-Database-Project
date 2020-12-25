-- 2NF
CREATE TABLE tblWrongEmployeeDepartmentConcatenated(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	EmployeeName Nvarchar(50) NOT NULL,
	Gender  Nvarchar(50) NOT NULL,
	Salary INT NOT NULL,
	DeptName Nvarchar(50) NOT NULL,
	DeptHead Nvarchar(50) NOT NULL,
	DeptLocation Nvarchar(50) NOT NULL
);
INSERT INTO tblWrongEmployeeDepartmentConcatenated VALUES ('Sara', 'Female', 3323, 'HR', 'Sara', 'Berlin');
INSERT INTO tblWrongEmployeeDepartmentConcatenated VALUES ('Sarah', 'Female', 4444, 'IT', 'John', 'London');
INSERT INTO tblWrongEmployeeDepartmentConcatenated VALUES ('Mike', 'Male', 5333, 'HR', 'Sara', 'Berlin');
INSERT INTO tblWrongEmployeeDepartmentConcatenated VALUES ('John', 'Male', 3243, 'IT', 'John', 'London');
SELECT * from tblWrongEmployeeDepartmentConcatenated;

-- Correct 2NF Tables
CREATE TABLE tblEmployee2NF (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	EmployeeName Nvarchar(50) NOT NULL,
	Gender Nvarchar(10) NOT NULL,
	Salary INT NOT NULL,
	DeptId Int Foreign Key References tblDepartment2NF(Id)
);
INSERT INTO tblEmployee2NF VALUES ('Sara', 'Female', 3323, 2);
INSERT INTO tblEmployee2NF VALUES ('Sarah', 'Female', 4444, 1);
INSERT INTO tblEmployee2NF VALUES ('Mike', 'Male', 5333, 2);
INSERT INTO tblEmployee2NF VALUES ('John', 'Male', 3243, 1);

CREATE TABLE tblDepartment2NF (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	DeptName Nvarchar(50) NOT NULL,
	DeptHead Nvarchar(50) NOT NULL,
	DeptLocation Nvarchar(50) NOT NULL
);
INSERT INTO tblDepartment2NF VALUES ('IT', 'John', 'London');
INSERT INTO tblDepartment2NF VALUES ('HR', 'Sara', 'Berlin');

Select * from tblEmployee2NF;
Select * from tblDepartment2NF;

-- 3NF
CREATE TABLE tblWrongEmployeeDepartmentConcatenated(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	EmployeeName Nvarchar(50) NOT NULL,
	Gender  Nvarchar(50) NOT NULL,
	Salary INT NOT NULL,
	AnnualSalary INT NOT NULL, -- We can calculate the annual salary, therefore we can remove this record from the table
	DeptName Nvarchar(50) NOT NULL,
	DeptHead Nvarchar(50) NOT NULL,
	DeptLocation Nvarchar(50) NOT NULL
);

-- Correct 3NF Tables
CREATE TABLE tblEmployee3NF (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	EmployeeName Nvarchar(50) NOT NULL,
	Gender Nvarchar(10) NOT NULL,
	Salary INT NOT NULL,
	DeptId Int Foreign Key References tblDepartment3NF(Id)
);
INSERT INTO tblEmployee3NF VALUES ('Sara', 'Female', 3323, 2);
INSERT INTO tblEmployee3NF VALUES ('Sarah', 'Female', 4444, 1);
INSERT INTO tblEmployee3NF VALUES ('Mike', 'Male', 5333, 2);
INSERT INTO tblEmployee3NF VALUES ('John', 'Male', 3243, 1);

CREATE TABLE tblDepartment3NF (
	Id INT PRIMARY KEY IDENTITY(1, 1),
	DeptName Nvarchar(50) NOT NULL,
	DeptHead Nvarchar(50) NOT NULL,
	DeptLocation Nvarchar(50) NOT NULL
);
INSERT INTO tblDepartment3NF VALUES ('IT', 'John', 'London');
INSERT INTO tblDepartment3NF VALUES ('HR', 'Sara', 'Berlin');

Select Id, EmployeeName, Gender, Salary, DeptId, Salary * 12  as AnnualSalary from tblEmployee3NF;
Select * from tblDepartment3NF;