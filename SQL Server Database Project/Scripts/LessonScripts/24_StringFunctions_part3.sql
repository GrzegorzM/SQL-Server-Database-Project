-- REPLICATE
Select REPLICATE('Hello World!', 3);
Select Name, Gender, SUBSTRING(Email, 1, 2) + REPLICATE('*', 5) + SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email) - CHARINDEX('@', Email)) as Email from tblEmployee;

-- SPACE
Select '     ';
Select SPACE(5);
Select Name + SPACE(5) + Gender from tblEmployee;

-- PATINDEX(similar to CHARINDEX() but additionally enables wildcards: %, _, ?)
Select Email, PATINDEX('%mail.com', Email) as FirstOccuranceIndex from tblEmployee
Where PATINDEX('%mail.com', Email) > 0;

-- REPLACE
Select Email, REPLACE(Email, '.com', '.net') as ConvertedEmail from tblEmployee;

-- STUFF
Select Name, Email, STUFF(Email, 2, 3, '*****') as StuffedEmail from tblEmployee;