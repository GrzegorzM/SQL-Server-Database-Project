-- LEFT
Select LEFT('ABCDEF', 3);

--RIGHT
Select RIGHT('ABCDEF', 3);

-- CHAR
Select CHARINDEX('@', 'Sara@gmail.com', 1);
Select CHARINDEX('@', 'Sara@gmail.com');

-- SUBSTRING
Select SUBSTRING('Sara@gmail.com', 6, 9);
Select SUBSTRING('Sara@gmail.com', CHARINDEX('@', 'Sara@gmail.com') + 1, LEN('Sara@gmail.com') - CHARINDEX('@', 'Sara@gmail.com'));

Alter Table tblEmployee
Add Email Nvarchar(50);
Insert into tblEmployee values('Sara', 'Female', 1, 'Sara@gmail.com');
Select SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email) - CHARINDEX('@', Email)) as EmailDomain, Count(Email) as Total from tblEmployee
Group by SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email) - CHARINDEX('@', Email));