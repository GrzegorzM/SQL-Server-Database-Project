CREATE TABLE #tblDates(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[SmallDateTime] SMALLDATETIME NULL,
	[DateTime] DATETIME NULL,
);
INSERT INTO #tblDates([SmallDateTime]) VALUES('12/31/1899'); -- ERROR - Out-of-range value.
INSERT INTO #tblDates([SmallDateTime]) VALUES('01/01/1900');
INSERT INTO #tblDates([SmallDateTime]) VALUES('07/06/2079'); -- ERROR - Out-of-range value.
INSERT INTO #tblDates([SmallDateTime]) VALUES('06/06/2079');

INSERT INTO #tblDates([DateTime]) VALUES('31/12/1752'); -- ERROR - Out-of-range value.
INSERT INTO #tblDates([DateTime]) VALUES('01/01/1753');
INSERT INTO #tblDates([DateTime]) VALUES('01/01/10000'); -- ERROR - Out-of-range value.
INSERT INTO #tblDates([DateTime]) VALUES('12/31/9999');

-- DATETIME - Time rounded to 1 minute.
INSERT INTO #tblDates([SmallDateTime]) VALUES('01/01/1900 23:59:59.999'); -- Rounded up: 1900-01-02 00:00:00
INSERT INTO #tblDates([SmallDateTime]) VALUES('01/01/1900 23:59:29.998'); -- Rounded down: 1900-01-01 23:59:00
INSERT INTO #tblDates([SmallDateTime]) VALUES('01/01/1900 23:59:29.999'); -- Rounded up: 1900-01-02 00:00:00

-- DATETIME - Time rounded to 3.33 milliseconds: .003 .007 .000.
INSERT INTO #tblDates([DateTime]) VALUES('01/01/1900 23:59:59.990'); -- Rounded up: 1900-01-01 23:59:59.990
INSERT INTO #tblDates([DateTime]) VALUES('01/01/1900 23:59:29.991'); -- Rounded down: 1900-01-01 23:59:29.990
INSERT INTO #tblDates([DateTime]) VALUES('01/01/1900 23:59:29.992'); -- Rounded up: 1900-01-01 23:59:29.993
INSERT INTO #tblDates([DateTime]) VALUES('01/01/1900 23:59:59.993'); -- Rounded up: 1900-01-01 23:59:59.993
INSERT INTO #tblDates([DateTime]) VALUES('01/01/1900 23:59:29.994'); -- Rounded down: 1900-01-01 23:59:29.993
INSERT INTO #tblDates([DateTime]) VALUES('01/01/1900 23:59:29.995'); -- Rounded up: 1900-01-01 23:59:29.997
INSERT INTO #tblDates([DateTime]) VALUES('01/01/1900 23:59:29.996'); -- Rounded down: 1900-01-01 23:59:29.997
INSERT INTO #tblDates([DateTime]) VALUES('01/01/1900 23:59:29.997'); -- Rounded up: 1900-01-01 23:59:29.997
INSERT INTO #tblDates([DateTime]) VALUES('01/01/1900 23:59:59.998'); -- Rounded up: 1900-01-01 23:59:59.997
INSERT INTO #tblDates([DateTime]) VALUES('01/01/1900 23:59:29.999'); -- Rounded down: 1900-01-01 23:59:29.990

SELECT * FROM #tblDates;