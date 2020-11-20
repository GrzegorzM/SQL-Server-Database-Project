-- ASCII
Select ASCII('e');
Select ASCII('ABC'); -- Returns the ascii code of the first char.

--Char
Select Char(101);

Declare @Start int;
Declare @End int;
Set @Start = ASCII('A');
Set @End =ASCII('Z');
While (@Start <= @END)
Begin
	Print Char(@Start);
	Set @Start = @Start + 1;
End;

-- LTRIM
Insert into tblEmployeeNames Values('    Bob   ', '       Danny   ', '      Harris    ');
Select '         Hello';
Select LTRIM('         Hello');
Select LTRIM(FirstName) as FirstName, MiddleName, LastName from tblEmployeeNames;

-- RTRIM
Select '         Hello                ';
Select RTRIM('         Hello       ');
Select FirstName, MiddleName, LastName, RTRIM(LTRIM(FirstName + ' ' + MiddleName + ' ' + LastName)) as FullName from tblEmployeeNames; -- Removing spaces from concatenated string - after concatenation is complete(spaces in the middle of text are not removed).
Select FirstName, MiddleName, LastName, RTRIM(LTRIM(FirstName)) + ' ' + RTRIM(LTRIM(MiddleName)) + ' ' + RTRIM(LTRIM(LastName)) as FullName from tblEmployeeNames; -- Removing spaces before concatenation is complete.

-- LOWER
Select LOWER(FirstName) as FirstName, MiddleName, LastName, RTRIM(LTRIM(FirstName)) + ' ' + RTRIM(LTRIM(MiddleName)) + ' ' + RTRIM(LTRIM(LastName)) as FullName from tblEmployeeNames;

-- UPPER
Select UPPER(FirstName) as FirstName, MiddleName, LastName, RTRIM(LTRIM(FirstName)) + ' ' + RTRIM(LTRIM(MiddleName)) + ' ' + RTRIM(LTRIM(LastName)) as FullName from tblEmployeeNames;

-- REVERSE
Select REVERSE('Reversed String');

-- LEN(means length)
Select FirstName, LEN(LTRIM(FirstName)) as Length from tblEmployeeNames; -- The Len function does not count spaces on the right.