CREATE TABLE #tblDates(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	[DateTime] DATETIME NULL,
	[DateTimePrecision0] DATETIME2(0) NULL,
	[DateTimePrecision1] DATETIME2(1) NULL,
	[DateTimePrecision2] DATETIME2(2) NULL,
	[DateTimePrecision3] DATETIME2(3) NULL,
	[DateTimePrecision4] DATETIME2(4) NULL,
	[DateTimePrecision5] DATETIME2(5) NULL,
	[DateTimePrecision6] DATETIME2(6) NULL,
	[DateTimePrecision7] DATETIME2(7) NULL,
);

INSERT INTO #tblDates VALUES(
	'2020-12-20 15:57:55.123', -- .123 Max precision for DateTime. .1234567 - ERROR: Conversion failed when converting date and/or time from character string.
	'2020-12-20 15:57:55.1234567',
	'2020-12-20 15:57:55.1234567', 
	'2020-12-20 15:57:55.1234567', 
	'2020-12-20 15:57:55.1234567', 
	'2020-12-20 15:57:55.1234567', 
	'2020-12-20 15:57:55.1234567', 
	'2020-12-20 15:57:55.1234567', 
	'2020-12-20 15:57:55.1234567');
SELECT * FROM #tblDates;
SELECT 'Precision - 0' AS [Precision], [DateTime] AS [DateTime], DATALENGTH([DateTimePrecision0]) AS [Storage Size] FROM #tblDates;

SELECT 'Datetime ' AS [Precision], [DateTime] AS [DateTime], DATALENGTH([DateTime]) AS [Storage Size] FROM #tblDates
UNION ALL
SELECT 'Precision - 0' AS [Precision], [DateTimePrecision0] AS [DateTime], DATALENGTH([DateTimePrecision0]) AS [Storage Size] FROM #tblDates
UNION ALL
SELECT 'Precision - 1' AS [Precision], [DateTimePrecision1] AS [DateTime], DATALENGTH([DateTimePrecision1]) AS [Storage Size] FROM #tblDates
UNION ALL
SELECT 'Precision - 2' AS [Precision], [DateTimePrecision2] AS [DateTime], DATALENGTH([DateTimePrecision2]) AS [Storage Size] FROM #tblDates
UNION ALL
SELECT 'Precision - 3' AS [Precision], [DateTimePrecision3] AS [DateTime], DATALENGTH([DateTimePrecision3]) AS [Storage Size] FROM #tblDates
UNION ALL
SELECT 'Precision - 4' AS [Precision], [DateTimePrecision4] AS [DateTime], DATALENGTH([DateTimePrecision4]) AS [Storage Size] FROM #tblDates
UNION ALL
SELECT 'Precision - 5' AS [Precision], [DateTimePrecision5] AS [DateTime], DATALENGTH([DateTimePrecision5]) AS [Storage Size] FROM #tblDates
UNION ALL
SELECT 'Precision - 6' AS [Precision], [DateTimePrecision6] AS [DateTime], DATALENGTH([DateTimePrecision6]) AS [Storage Size] FROM #tblDates
UNION ALL
SELECT 'Precision - 7' AS [Precision], [DateTimePrecision7] AS [DateTime], DATALENGTH([DateTimePrecision7]) AS [Storage Size] FROM #tblDates;