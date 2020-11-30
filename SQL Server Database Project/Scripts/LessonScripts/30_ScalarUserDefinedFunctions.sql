-- returns a scalar value(single value)
Create Function fnCalculateAge(@DateOfBirth DATE) RETURNS INT
AS BEGIN
	DECLARE @Age INT;

	SET @Age = DATEDIFF(YEAR, @DateOfBirth, GETDATE()) - 
			   CASE
				WHEN (MONTH(@DateOfBirth) > MONTH(GETDATE())) OR 
					 (MONTH(@DateOfBirth) = MONTH(GETDATE()) AND DAY(@DateOfBirth) > DAY(GETDATE())) THEN 1
				ELSE 0
			   END;
	RETURN @Age;
END

Select Name, DateOfBirth, dbo.fnCalculateAge(DateOfBirth) as Age from tblEmployee;
Select Name, DateOfBirth, dbo.fnCalculateAge(DateOfBirth) as Age from tblEmployee where dbo.fnCalculateAge(DateOfBirth) > 30;