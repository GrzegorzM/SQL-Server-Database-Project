Select * from tblSales;

Select Product, SUM(SaleAmount) as TotalSales from tblSales
GROUP BY Product;

Select Product, SUM(SaleAmount) as TotalSales from tblSales
GROUP BY Product HAVING SUM(SaleAmount) > 1000;

Select Product, SUM(SaleAmount) as TotalSales from tblSales -- Error - Incorrect syntax.
GROUP BY Product WHERE SUM(SaleAmount) > 1000;

Select Product, SUM(SaleAmount) as TotalSales from tblSales -- Error - An aggregate may not appear in the WHERE clause.
WHERE SUM(SaleAmount) > 1000 GROUP BY Product;

-- Filtering data before grouping - faster performance, grouping pre-filtered data.
Select Product, SUM(SaleAmount) as TotalSales from tblSales
WHERE Product IN('iPhone', 'Laptop') GROUP BY Product;

-- Filtering data after grouping - slower performance, grouping all existing data and then filter it from the groups created.
Select Product, SUM(SaleAmount) as TotalSales from tblSales
GROUP BY Product HAVING Product IN('iPhone', 'Laptop');

Select Product, SUM(SaleAmount) as TotalSales from tblSales
WHERE Product IN('iPhone', 'Laptop') GROUP BY Product HAVING SUM(SaleAmount) > 1000;

-- Difference between WHERE and Having
-- 1. WHERE clause cannot be used with aggregates where as HAVING can. This means WHERE clause is used for filtering individual rows where as HAVING clause is used to filter groups.
-- 2. WHERE comes before GROUP BY. This means WHERE clause filters rows before aggregate calculations are performed. HAVING comes after GROUP BY. This means HAVING clause filters rows after aggregate calculations are performed. So from a performance standpoint, HAVING is slower than WHERE and should be avoided when possible.
-- 3. WHERE and HAVING can be used together in a SELECT query. In this case WHERE clause is applied first to filter individual rows. The rows are then grouped and aggregate calculations are performed, and then the HAVING clause filters the groups.