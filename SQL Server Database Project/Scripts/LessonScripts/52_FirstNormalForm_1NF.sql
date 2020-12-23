-- Database normalization is the process of organizing data to minimize data redundancy (data duplication), which in turn ensures data consistency
-- There are 6 normal forms, First Normal form (1NF) thru Sixth Normal Form (6NF).
-- Most databases are in third normal form (3NF). There are certain rules, that each normal form should follow.

-- A table is said to be in 1NF, if
-- 1. The data in each column should be atomic. No multiple values, sepearated by comma.
-- 2. The table does not contain any repeating column groups
-- 3. Identify each record uniquely using primary key.

-- 1NF
CREATE TABLE tblWrongEmployeeDepartment (
	DeptName Nvarchar(10) NOT NULL,
	EmployeeName Nvarchar(50) NOT NULL
);
INSERT INTO tblWrongEmployeeDepartment VALUES ('IT', 'Sara, Sarah, Mike');
INSERT INTO tblWrongEmployeeDepartment VALUES ('HR', 'John');

CREATE TABLE tblWrongEmployeeDepartment2 (
	DeptName Nvarchar(10) NOT NULL,
	EmployeeName1 Nvarchar(50) NULL,
	EmployeeName2 Nvarchar(50) NULL,
	EmployeeName3 Nvarchar(50) NULL
);
INSERT INTO tblWrongEmployeeDepartment2 VALUES ('IT', 'Sara', 'Sarah', 'Mike');
INSERT INTO tblWrongEmployeeDepartment2 VALUES ('HR', 'John', null, null);

-- Correct 1NF
CREATE TABLE tblEmployee1NF (
	Id Int PRIMARY KEY IDENTITY(1, 1),
	DeptId Int Foreign Key References tblDepartment1NF(Id),
	EmployeeName Nvarchar(50) NOT NULL
);
INSERT INTO tblEmployee1NF VALUES (1, 'Sara');
INSERT INTO tblEmployee1NF VALUES (2, 'John');
INSERT INTO tblEmployee1NF VALUES (2, 'Sarah');
INSERT INTO tblEmployee1NF VALUES (2, 'Mike');

CREATE TABLE tblDepartment1NF (
	Id Int PRIMARY KEY IDENTITY(1, 1),
	DeptName Nvarchar(50) NOT NULL
);
INSERT INTO tblDepartment1NF VALUES ('IT');
INSERT INTO tblDepartment1NF VALUES ('HR');

Select * from tblWrongEmployeeDepartment;
Select * from tblWrongEmployeeDepartment2;
Select * from tblEmployee1NF;
Select * from tblDepartment1NF;