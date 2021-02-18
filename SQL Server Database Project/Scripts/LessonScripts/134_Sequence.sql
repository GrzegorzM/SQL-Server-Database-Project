CREATE SEQUENCE dbo.SequenceObject AS INT
START WITH 1 INCREMENT BY 1;

-- Next value.
SELECT NEXT VALUE FOR dbo.SequenceObject;

-- Current value.
SELECT Current_value FROM SYS.SEQUENCES WHERE NAME = 'SequenceObject';

-- All informations about sequence.
SELECT * FROM SYS.SEQUENCES WHERE NAME = 'SequenceObject';

-- Reset value.
ALTER SEQUENCE SequenceObject RESTART WITH 1;

CREATE TABLE #tblNoIdentity(
	Id INT PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL,
	Gender NVARCHAR(10) NOT NULL,
)
INSERT INTO #tblNoIdentity VALUES(NEXT VALUE FOR dbo.SequenceObject, 'Greg', 'Male');
INSERT INTO #tblNoIdentity VALUES(NEXT VALUE FOR dbo.SequenceObject, 'Sara', 'Male');
SELECT * FROM #tblNoIdentity;

CREATE SEQUENCE dbo.DecrementSequenceObject AS INT
START WITH 1 INCREMENT BY -1;
SELECT NEXT VALUE FOR dbo.DecrementSequenceObject;

CREATE SEQUENCE dbo.DecrementSequenceObjectRange AS INT
START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 5;
SELECT NEXT VALUE FOR dbo.DecrementSequenceObjectRange; -- ERROR after NEXT VALUE > MAXVALUE - The sequence object 'DecrementSequenceObjectRange' has reached its minimum or maximum value. Restart the sequence object to allow new values to be generated.
ALTER SEQUENCE dbo.DecrementSequenceObjectRange
INCREMENT BY 1 MINVALUE 1 MAXVALUE 5 CYCLE; -- 'AS INT' and 'START WITH 1' removed when altering sequence.
SELECT NEXT VALUE FOR dbo.DecrementSequenceObjectRange; -- NEXT VALUE autoresets after reaching MAXVALUE.

CREATE SEQUENCE dbo.DecrementSequenceObjectRangeCache AS INT
START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 5 CYCLE CACHE 10;
SELECT NEXT VALUE FOR dbo.DecrementSequenceObjectRangeCache;

DROP SEQUENCE dbo.SequenceObject;