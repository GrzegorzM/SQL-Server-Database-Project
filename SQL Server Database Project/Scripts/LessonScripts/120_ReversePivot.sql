SELECT * FROM tblProductSales;

SELECT SalesAgent, UK, Germany FROM tblProductSales
PIVOT(
	SUM(SalesAmount) FOR SalesCountry IN(UK, Germany)
) AS PivotExample;

-- It is possible to UNPIVOT data that has an Id column because the Pivot operator does not aggregate it.
SELECT SalesAgent, SalesCountry, SalesAmount FROM
(SELECT SalesAgent, UK, USA, Germany FROM tblProductSales
PIVOT(
	SUM(SalesAmount) FOR SalesCountry IN(UK, USA, Germany)
) AS PivotExample) AS PivotOperator
UNPIVOT(
	SalesAmount FOR SalesCountry IN(UK, USA, Germany)
) AS UnpivotExample;
SELECT * FROM tblProductSales;

-- If UNPIVOT operator is used with the query below, it is impossible to get orginial data back as the PIVOT operator has already aggregated the data, and there is no way for SQL Server to know how to undo the aggregations.
SELECT SalesAgent, SalesCountry, SalesAmount FROM
(SELECT SalesAgent, UK, USA, Germany FROM tblProductSalesNoIdColumn
PIVOT(
	SUM(SalesAmount) FOR SalesCountry IN(UK, USA, Germany)
) AS PivotExample) AS PivotOperator
UNPIVOT(
	SalesAmount FOR SalesCountry IN(UK, USA, Germany)
) AS UnpivotExample;
SELECT * FROM tblProductSalesNoIdColumn;