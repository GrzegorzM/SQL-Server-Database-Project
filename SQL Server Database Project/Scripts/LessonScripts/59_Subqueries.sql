select p.* from tblProducts1 p left join tblProductSales1 s on p.Id = s.ProductId where s.ProductId is null;
select * from tblProducts1 where Id not in(select distinct ProductId from tblProductSales1);
select Name, (select Sum(QuantitySold) from tblProductSales1 where ProductId = tblProducts1.Id) as TotalSold from tblProducts1;
select Name, Sum(s.QuantitySold) as TotalSold from tblProducts1 p left join tblProductSales1 s on p.Id = s.ProductId group by Name;
select Name, (select Sum(QuantitySold * UnitPrice) from tblProductSales1 where ProductId = tblProducts1.Id) as TotalMoneySpend from tblProducts1;
select Name, Sum(s.QuantitySold * UnitPrice) as TotalMoneySpend from tblProducts1 p left join tblProductSales1 s on p.Id = s.ProductId group by Name;

-- In most cases JOINs are faster than SUB-QUERIEs. However, in cases, where you only need a subset of records from a table that you are joining with, sub-queries can be faster.
-- For example, if the table to be joined has millions of records and many columns, then the subquery with the filtered data will be faster in terms of performance.