SELECT SalesCountry, SalesAgent, SUM(SalesAmount) as Total FROM tblProductSales
GROUP BY SalesCountry, SalesAgent ORDER BY SalesCountry, SalesAgent;

SELECT SalesAgent, Germany, France, US, UK
FROM tblProductSales
Pivot
(
   Sum(SalesAmount) FOR SalesCountry in (Germany, France, US, UK)
) as PivotTable;

SELECT SalesAgent, Germany, France, US, UK
FROM (
   SELECT SalesAgent, SalesCountry, SalesAmount FROM tblProductSales
) as SourceTable
Pivot (
 Sum(SalesAmount) FOR SalesCountry in (Germany, France, US, UK)
) as PivotTable;