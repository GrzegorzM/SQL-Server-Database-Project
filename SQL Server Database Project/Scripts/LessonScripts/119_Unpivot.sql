SELECT * FROM tblProductSalesUnpivot;

SELECT SalesAgent, Country, SalesAmount FROM tblProductSalesUnpivot
UNPIVOT(
	SalesAmount FOR Country IN(India, USA, UK)
) AS UnpivotExample;