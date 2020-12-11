Select * from tblProduct;
Select * from tblProductSales1 ;

Select Name, SUM(p.UnitPrice * s.QuantitySold), Count(Id) as TotalTransactions from tblProduct p
join tblProductSales1 s on p.ProductId = s.ProductId
group by Name;

CREATE VIEW vTotalSalesByProduct
WITH SCHEMABINDING AS
	Select Name, ISNULL(SUM(p.UnitPrice * s.QuantitySold), 0) as TotalSales, Count(Id) as TotalTransactions from dbo.tblProduct p
	join dbo.tblProductSales1 s on p.ProductId = s.ProductId
	group by Name;
Select * from vTotalSalesByProduct;

CREATE UNIQUE CLUSTERED INDEX UIX_vTotalSalesByProduct_Name
on vTotalSalesByProduct(Name); -- Cannot create index on view "Sample.dbo.vTotalSalesByProduct" because it uses the aggregate COUNT. Use COUNT_BIG instead. Consider adding COUNT_BIG(*).

ALTER VIEW vTotalSalesByProduct
WITH SCHEMABINDING AS
	Select Name, SUM(ISNULL((p.UnitPrice * s.QuantitySold), 0)) as TotalSales, Count_Big(*) as TotalTransactions from dbo.tblProduct p
	join dbo.tblProductSales1 s on p.ProductId = s.ProductId
	group by Name;

-- Since, the view have an index it gets materialized. The data is stored in the view. So when Select * from vWTotalSalesByProduct is executed, the data is returned from the view itself, rather than retrieving data from the underlying base tables(without an index in the view, the data will be computed each time the view is called).
-- Indexed views, can significantly improve the performance of queries that involves JOINS and Aggeregations. The cost of maintaining an indexed view is much higher than the cost of maintaining a table index. 