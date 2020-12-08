-- Statements that will benefit from Indexes

	-- The following select query benefits from the index on the Salary column, because the salaries are sorted in ascending order in the index. From the index, it's easy to identify the records where salary is between 4000 and 8000, and using the row address the corresponding records from the table can be fetched quickly.
	Select * from tblEmployee where Salary > 4000 and Salary < 8000;

	-- DELETE and UPDATE statements can also benefit from the index. To update or delete a row, SQL server needs to first find that row, and the index can help in searching and finding that specific row quickly.
	Delete from tblEmployee where Salary = 2500
	Update tblEmployee Set Salary = 9000 where Salary = 7500;

	-- Indexes can also help queries, that ask for sorted results. Since the Salaries are already sorted, the database engine, simply scans the index from the first entry to the last entry and retrieve the rows in sorted order. This avoids, sorting of rows during query execution, which can significantly improve the processing time.
	Select * from tblEmployee order by Salary;

	-- The index on the Salary column, can also help the query below, by scanning the index in reverse order.
	Select * from tblEmployee order by Salary Desc;

	-- GROUP BY queries can also benefit from indexes. To group the Employees with the same salary, the query engine, can use the index on Salary column, to retrieve the already sorted salaries. Since matching salaries are present in consecutive index entries, it is easy to count the total number of Employees at each Salary quickly. 
	Select Salary, COUNT(Salary) as Total from tblEmployee
	Group By Salary;