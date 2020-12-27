SELECT SalesCountry, SalesAgent, SUM(SalesAmount) as Total FROM tblProductSales
GROUP BY SalesCountry, SalesAgent ORDER BY SalesCountry, SalesAgent;

-- The presence of the Id column in tblProductSales means that it is also taken into account when performing pivoting and group by. To eliminate this from the calculations use derived table, which only selects required columns: SALESAGENT, SALESCOUNTRY, and SALESAMOUNT.
SELECT SalesAgent, Germany, France, US, UK
FROM tblProductSales
Pivot
(
   Sum(SalesAmount) FOR SalesCountry in (Germany, France, US, UK)
) as PivotTable;

-- Removing duplicates from the result with an existing Id column in the base table.
SELECT SalesAgent, Germany, France, US, UK
FROM (
   SELECT SalesAgent, SalesCountry, SalesAmount FROM tblProductSales
) as SourceTable
Pivot (
 Sum(SalesAmount) FOR SalesCountry in (Germany, France, US, UK)
) as PivotTable;