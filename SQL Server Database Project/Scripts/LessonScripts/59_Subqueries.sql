select p.* from tblProducts1 p left join tblProductSales1 s on p.Id = s.ProductId where s.ProductId is null;
select * from tblProducts1 where Id not in(select distinct ProductId from tblProductSales1);
select Name, (select Sum(QuantitySold) from tblProductSales1 where ProductId = tblProducts1.Id) as TotalSold from tblProducts1;
select Name, Sum(s.QuantitySold) as TotalSold from tblProducts1 p left join tblProductSales1 s on p.Id = s.ProductId group by Name;
select Name, (select Sum(QuantitySold * UnitPrice) from tblProductSales1 where ProductId = tblProducts1.Id) as TotalMoneySpend from tblProducts1;
select Name, Sum(s.QuantitySold * UnitPrice) as TotalMoneySpend from tblProducts1 p left join tblProductSales1 s on p.Id = s.ProductId group by Name;