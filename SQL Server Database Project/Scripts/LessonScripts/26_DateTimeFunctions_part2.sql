-- ISDATE
Select ISDATE('PRAGIM'); -- invalid

Select ISDATE(GetDate()); -- valid
Select ISDATE('2020-11-24 22:12:53.340'); -- valid

Select ISDATE(SysDateTime()); -- exception
Select ISDATE('2020-11-24 22:14:36.1681609'); -- invalid

-- DAY
Select DAY(GetDate());
Select DAY('2077-11-01 22:12:53.340');

-- Month
Select MONTH(GetDate());
Select MONTH('2077-11-01 22:12:53.340');

-- Year
Select YEAR(GetDate());
Select YEAR('2077-11-01 22:12:53.340');

-- DateName
Select DateName(DAY, '2077-11-01 22:12:53.340') -- Returns: 1
Select DateName(WEEKDAY, '2077-11-01 22:12:53.340') -- Returns: Monday
Select DateName(MONTH, '2077-11-01 22:12:53.340') -- Returns: November
-- year 	yy, yyyy
-- quarter 	qq, q
-- month 	mm, m
-- dayofyear 	dy, y
-- day 	dd, d
-- week 	wk, ww
-- weekday 	dw, w
-- hour 	hh
-- minute 	mi, n
-- second 	ss, s
-- millisecond 	ms
-- microsecond 	mcs
-- nanosecond 	ns
-- TZoffset 	tz
-- ISO_WEEK 	ISOWK, ISOWW

Alter Table tblEmployee
Add DateOfBirth Datetime;
update tblEmployee set DateOfBirth = GetDate() where Id = 1;

Select Name, DateOfBirth, DateName(WEEKDAY,DateOfBirth) as [Day], 
            Month(DateOfBirth) as MonthNumber, 
            DateName(MONTH, DateOfBirth) as [MonthName],
            Year(DateOfBirth) as [Year]
From   tblEmployee;