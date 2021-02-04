﻿SELECT CHOOSE(2, 'Germany', 'USA', 'UK') AS COUNTRY;
SELECT CHOOSE(0, 'Germany', 'USA', 'UK') AS COUNTRY; -- NULL
SELECT CHOOSE(4, 'Germany', 'USA', 'UK') AS COUNTRY; -- NULL

SELECT DATEPART(MM, DateOfBirth) FROM tblEmployee;
SELECT Name, DateOfBirth, 
    CASE DATEPART(MM, DateOfBirth)
			WHEN 1 THEN 'JAN'
			WHEN 2 THEN 'FEB'
			WHEN 3 THEN 'MAR'
			WHEN 4 THEN 'APR'
			WHEN 5 THEN 'MAY'
			WHEN 6 THEN 'JUN'
			WHEN 7 THEN 'JUL'
			WHEN 8 THEN 'AUG'
			WHEN 9 THEN 'SEP'
			WHEN 10 THEN 'OCT'
			WHEN 11 THEN 'NOV'
			WHEN 12 THEN 'DEC'
    END
       AS [MONTH]
FROM tblEmployee;

SELECT Name, DateOfBirth, CHOOSE(DATEPART(MM, DateOfBirth), 'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC') AS [MONTH] FROM tblEmployee;