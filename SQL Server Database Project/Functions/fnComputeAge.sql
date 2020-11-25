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