--1).  If the subquery depends on the outer query for its values, then that sub query is called as a correlated subquery.

--2). In the where clause of the subquery below, "ProductId" column get it's value from tblProducts table that is present in the outer query.
--So, here the subquery is dependent on the outer query for it's value, hence this subquery is a correlated subquery.
--Correlated subqueries get executed, once for every row that is selected by the outer query. corelated subquery, cannot be executed independently of the outer query.
select Name, (select Sum(QuantitySold) from tblProductSales1 where tblProducts1.Id = ProductId) as Total from tblProducts1;