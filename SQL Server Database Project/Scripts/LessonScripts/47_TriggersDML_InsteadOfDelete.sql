Select * from vEmployeeDetails;
Delete from vEmployeeDetails where Id = 1; -- Error - View or function 'vEmployeeDetails' is not updatable because the modification affects multiple base tables.

Create Trigger TR_vEmployeeDetails_InsteadOfDelete
ON vEmployeeDetails INSTEAD OF DELETE
AS BEGIN
 Delete tblEmployee from tblEmployee join deleted on tblEmployee.Id = deleted.Id;
 
 -- Another way to do it with subquery
 -- Delete from tblEmployee where Id in (Select Id from deleted);
END;
Delete from vEmployeeDetails where Id in(18, 19);