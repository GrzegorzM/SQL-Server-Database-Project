SELECT NEWID();

DECLARE @Id UNIQUEIDENTIFIER;
SET @Id = NEWID();
SELECT @Id;

-- Merging data from two tables by using a PRIMARY KEY.
CREATE TABLE #tblCustomersUSA
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50) NOT NULL
);

CREATE TABLE #tblCustomersUK
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50) NOT NULL
);

INSERT INTO #tblCustomersUSA VALUES('Tom');
INSERT INTO #tblCustomersUSA VALUES('Mary');
INSERT INTO #tblCustomersUK VALUES('John');
INSERT INTO #tblCustomersUK VALUES('Emma');
SELECT * FROM #tblCustomersUSA;
SELECT * FROM #tblCustomersUK;

CREATE TABLE #tblCustomers
(
	Id INT PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL
);

INSERT INTO #tblCustomers -- ERROR - Cannot insert duplicate key in object 'dbo.#tblCustomers'. The duplicate key value is (1).
SELECT * FROM #tblCustomersUSA
UNION ALL
SELECT * FROM #tblCustomersUK;

DROP TABLE #tblCustomersUSA;
DROP TABLE #tblCustomersUK;
DROP TABLE #tblCustomers;

-- Merging data from two tables by using a UNIQUEIDENTIFIER.
CREATE TABLE #tblCustomersUSA
(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	Name NVARCHAR(50) NOT NULL
);

CREATE TABLE #tblCustomersUK
(
	Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	Name NVARCHAR(50) NOT NULL
);
INSERT INTO #tblCustomersUSA VALUES(DEFAULT, 'Tom');
INSERT INTO #tblCustomersUSA VALUES(DEFAULT, 'Mary');
INSERT INTO #tblCustomersUK VALUES(DEFAULT, 'John');
INSERT INTO #tblCustomersUK VALUES(DEFAULT, 'Emma');

CREATE TABLE #tblCustomers
(
	Id UNIQUEIDENTIFIER PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL
);
INSERT INTO #tblCustomers
SELECT * FROM #tblCustomersUSA
UNION ALL
SELECT * FROM #tblCustomersUK;

SELECT * FROM #tblCustomers;