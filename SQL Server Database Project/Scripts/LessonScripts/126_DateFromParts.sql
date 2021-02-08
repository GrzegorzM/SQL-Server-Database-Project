﻿SELECT DATEFROMPARTS(2021, 05, 13) AS [Date];
SELECT DATEFROMPARTS(2021, 15, 13) AS [Date]; -- ERROR
SELECT DATEFROMPARTS(2021, NULL, 13) AS [Date]; -- NULL

SELECT DATETIMEFROMPARTS(2021, 05, 13, 23, 59, 59, 123) AS [Date]; -- 2021-05-13 23:59:59.123
SELECT SMALLDATETIMEFROMPARTS(2021, 05, 13, 01, 01) AS [Date]; -- 2021-05-13 01:01:00