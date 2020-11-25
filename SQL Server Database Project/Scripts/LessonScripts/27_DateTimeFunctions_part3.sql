-- DATEPART
Select DATEPART(weekday, '2077-11-01 22:12:53.340'); -- returns 1
Select DATENAME(weekday, '2077-11-01 22:12:53.340'); -- returns Monday

-- DATEADD
Select DATEADD(day, 3, '2077-11-01 22:12:53.340'); -- returns 2077-11-04 22:12:53.340
Select DATEADD(day, -3, '2077-11-01 22:12:53.340'); -- returns 2077-10-29 22:12:53.340

-- DATEDIFF
Select DATEDIFF(day, '2074-11-01 22:12:53.340', '2077-11-01 22:12:53.340');
Select DATEDIFF(month, '2020-02-11 22:12:53.340', '2077-11-01 22:12:53.340');


CREATE FUNCTION fnComputeAge(@DateOfBirth DATETIME) RETURNS NVARCHAR(50)
AS BEGIN
	DECLARE @tempdate DATETIME, @years INT, @months INT, @days INT, @Age NVARCHAR(50);
	SELECT @tempdate = @DateOfBirth;

	SELECT @years = (DATEDIFF(YEAR, @tempdate, GETDATE()) - 
					 CASE WHEN (MONTH(@DateOfBirth) > MONTH(GETDATE())) OR (MONTH(@DateOfBirth) = MONTH(GETDATE()) AND DAY(@DateOfBirth) > DAY(GETDATE())) 
						THEN 1 
						ELSE 0 
					 END);
	SELECT @tempdate = DATEADD(YEAR, @years, @tempdate);

	SELECT @months = (DATEDIFF(MONTH, @tempdate, GETDATE()) - 
  					  CASE WHEN DAY(@DateOfBirth) > DAY(GETDATE()) 
						THEN 1 
						ELSE 0 
					  END);
	SELECT @tempdate = DATEADD(MONTH, @months, @tempdate);

	SELECT @days = DATEDIFF(DAY, @tempdate, GETDATE());

	SET @Age = Cast(@years AS  NVARCHAR(4)) + ' Years ' + Cast(@months AS  NVARCHAR(2))+ ' Months ' +  Cast(@days AS  NVARCHAR(2))+ ' Days Old';
	RETURN @Age;
End;

Select dbo.fnComputeAge('2074-11-01 22:12:53.340') as Age; -- User-Defined Functions must be prefixed with dbo schema

Select Id, Name, DateOfBirth, dbo.fnComputeAge(DateOfBirth) as Age from tblEmployee;