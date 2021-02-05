SELECT TRY_PARSE('99' AS INT) AS Result; -- 99
SELECT TRY_PARSE('ABC' AS INT) AS Result; -- NULL
SELECT PARSE('99' AS INT) AS Result; -- 99
SELECT PARSE('ABC' AS INT) AS Result; -- ERROR

SELECT 
CASE WHEN TRY_PARSE('ABC' AS INT) IS NULL
	THEN 'Conversion Failed'
	ELSE 'Conversion Successful'
END AS Result;

IF TRY_PARSE('ABC' AS INT) IS NULL
  SELECT 'Conversion Failed';
ELSE 
  SELECT 'Conversion Successful';

SELECT IIF(TRY_PARSE('ABC' AS INT) IS NULL, 'Conversion Failed', 'Conversion Successful') AS Result;

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

SELECT Name, PARSE(Age AS INT) AS AGE FROM #tblEmployee; -- ERROR - Error converting string value 'FIFTY' into data type int using culture ''.
SELECT Name, TRY_PARSE(Age AS INT) AS AGE FROM #tblEmployee;