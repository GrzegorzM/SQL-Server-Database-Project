Select * from tblEmployee where Salary > 5000 and Salary < 7000;

-- Nonclustered 
CREATE INDEX IX_tblEmployee_Salary ON tblEmployee (Salary ASC);

-- Display all indexes attached to specified table
sp_Helpindex tblEmployee;

DROP INDEX tblEmployee.IX_tblEmployee_Salary;