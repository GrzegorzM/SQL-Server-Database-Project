Select Id, Name, CAST(DateOfBirth as nvarchar) as ConvertedDateOfBirth from tblEmployee;
Select Id, Name, CAST(DateOfBirth as nvarchar(10)) as ConvertedDateOfBirth from tblEmployee;
Select Id, Name, CONVERT(nvarchar, DateOfBirth) as ConvertedDateOfBirth from tblEmployee;
Select Id, Name, CONVERT(nvarchar(10), DateOfBirth) as ConvertedDateOfBirth from tblEmployee;
Select Id, Name, CONVERT(nvarchar(10), DateOfBirth, 103) as ConvertedDateOfBirth from tblEmployee; -- 103 = DateTime Style Format https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?redirectedfrom=MSDN&view=sql-server-ver15

Select Id, Name, Name + ' - ' + Id from tblEmployee; -- Error
Select Id, Name, Name + ' - ' + CAST(Id as varchar) as [Name - Id] from tblEmployee;

Select RegisteredDate, COUNT(Id) as TotalRegistrations From tblRegistrations
Group By RegisteredDate; -- Grouped by date and time, so each group has exactly one TotalRegistrations

Select CAST(RegisteredDate as DATE) as RegistrationDate, COUNT(Id) as TotalRegistrations From tblRegistrations
Group By CAST(RegisteredDate as DATE); -- Grouped by date, groups have different TotalRegistrations numbers

-- General rule - Use CAST() instead of CONVERT() unless you want to benefit from the CONVERT() style parameter 