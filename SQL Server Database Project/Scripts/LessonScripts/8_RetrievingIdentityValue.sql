Create Table Test1(
	Id int Identity(1, 1),
	Value nvarchar(20)
);

Create Table Test2(
	Id int Identity(1 ,1),
	Value nvarchar(20)
);

Insert into Test1 Values('ABC');
Select SCOPE_IDENTITY(); -- Last Identity value in same scope and session.
Select @@IDENTITY; -- Last Identity value in same session and across any scope.
Select IDENT_CURRENT('Test2'); -- Last Identity value for specific table across any session and across any scope.

Create Trigger trForInsert on Test1 for Insert
As Begin
	Insert into Test2 Values('XYZ');
End