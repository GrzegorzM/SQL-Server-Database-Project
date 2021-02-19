CREATE TABLE #tblEmployees
(
  Id INT PRIMARY KEY IDENTITY(1,1),
  Name NVARCHAR(50),
  Gender NVARCHAR(10)
);

CREATE SEQUENCE [dbo].[SequenceObjectDifferences]
AS INT
START WITH 1
INCREMENT BY 1;

CREATE TABLE #tblCustomers
(
  Id INT PRIMARY KEY,
  Name NVARCHAR(50),
  Gender NVARCHAR(10)
);

CREATE TABLE #tblUsers
(
  Id INT PRIMARY KEY,
  Name NVARCHAR(50),
  Gender NVARCHAR(10)
);

-- Same sequence object is generating the ID values for both the tables.
INSERT INTO #tblCustomers VALUES (NEXT VALUE for [dbo].[SequenceObject], 'Ben', 'Male');
INSERT INTO #tblCustomers VALUES (NEXT VALUE for [dbo].[SequenceObject], 'Sara', 'Female');

INSERT INTO #tblUsers VALUES (NEXT VALUE for [dbo].[SequenceObject], 'Tom', 'Male');
INSERT INTO #tblUsers VALUES (NEXT VALUE for [dbo].[SequenceObject], 'Pam', 'Female');
INSERT INTO #tblUsers VALUES (NEXT VALUE for [dbo].[SequenceObject], 'David', 'Male');

SELECT * FROM #tblCustomers;
SELECT * FROM #tblUsers;

-- Identity is related to a single table and cannot be incremented without insertion.
INSERT INTO #tblEmployees VALUES ('Todd', 'Male');
-- The sequence can be incremented by using NEXT VALUE.
SELECT NEXT VALUE FOR [dbo].[SequenceObject];

-- The sequence can have specified max value.
CREATE SEQUENCE [dbo].[SequenceObjectDifferencesMaxValue]
START WITH 1
INCREMENT BY 1
MAXVALUE 5;

-- The sequence can be automatically reset when the maximum value is reached.
CREATE SEQUENCE [dbo].[SequenceObjectDifferencesMaxValueCycle]
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 5
CYCLE;