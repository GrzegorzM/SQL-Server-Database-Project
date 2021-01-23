SELECT *,
	RANK() OVER(ORDER BY Salary DESC) AS [RANK],
	DENSE_RANK() OVER(ORDER BY Salary DESC) AS [DENSE_RANK],
	ROW_NUMBER() OVER(ORDER BY Salary DESC) AS [ROW_NUMBER]
FROM tblEmployee;

-- Similarities between RANK, DENSE_RANK and ROW_NUMBER functions.
-- Returns an increasing integer value starting at 1 based on the ordering of rows imposed by the ORDER BY clause (if there are no ties).
-- ORDER BY clause is required.
-- PARTITION BY clause is optional.
-- When the data is partitioned, the integer value is reset to 1 when the partition changes.
-- It behaves exactly the same if there are no duplicate rows for the specified OVER(ORDER BY) column.