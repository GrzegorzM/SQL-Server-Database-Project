SELECT TRY_CONVERT(INT, '99') AS Result;
SELECT CONVERT(INT, '99') AS Result;
SELECT TRY_CONVERT(INT, 'ABC') AS Result; -- NULL
SELECT CONVERT(INT, 'ABC') AS Result; -- ERROR - Conversion failed when converting the varchar value 'ABC' to data type int.
SELECT TRY_CONVERT(XML, 10) AS Result; -- ERROR - Explicit conversion from data type int to xml is not allowed.

SELECT
	CASE WHEN TRY_CONVERT(INT, '99') IS NULL
	THEN 'Conversion Failed'
	ELSE 'Conversion Successful'
END AS Result;

SELECT IIF(TRY_CONVERT(INT, '99') IS NULL, 'Conversion Failed', 'Conversion Successful') AS Result;

CREATE TABLE #tblEmployee(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50) NOT NULL,
	Age NVARCHAR(10) NULL
);
INSERT INTO #tblEmployee VALUES('Bob', '23');
INSERT INTO #tblEmployee VALUES('Mary', 'FIFTY');
INSERT INTO #tblEmployee VALUES('John', '43');
INSERT INTO #tblEmployee VALUES('Donald', 'THIRTY');
INSERT INTO #tblEmployee VALUES('Kate', '38');

SELECT Name, TRY_CONVERT(INT, Age) FROM #tblEmployee;
SELECT Name, CONVERT(INT, Age) FROM #tblEmployee; -- ERROR - Conversion failed when converting the nvarchar value 'FIFTY' to data type int.

-- Difference between TRY_PARSE and TRY_CONVERT functions.
-- TRY_PARSE can only be used for converting from string to date/time or number data types where as TRY_CONVERT can be used for any general type conversions.
SELECT TRY_CONVERT(XML, '[root][child/][/root]') AS [XML];
SELECT CONVERT(XML, '[root][child/][/root]') AS [XML];
SELECT TRY_PARSE('[root][child/][/root]' AS XML) AS [XML]; -- ERROR - Invalid data type xml in function TRY_PARSE.
SELECT PARSE('[root][child/][/root]' AS XML) AS [XML]; -- ERROR - Invalid data type xml in function TRY_PARSE.