select * from tblEmployeeNames;

Select Id, Coalesce(FirstName, MiddleName, LastName) as Name From tblEmployeeNames;