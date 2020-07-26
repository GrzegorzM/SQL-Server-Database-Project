select p.* from tblProducts2 p join tblProductSales2 s on p.Id = s.ProductId;
select * from tblProducts2 where Id in (select ProductId from tblProductSales2);

select p.* from tblProducts2 p left join tblProductSales2 s on p.Id = s.ProductId where s.ProductId is null;
select * from tblProducts2 where Id not in (select ProductId from tblProductSales2);
-- Exist returs true if subquery returs at least one row
-- Subquery will be executed once for every single row in table with a negative performance impact(in theory)
-- Negative performance impact is dependent on creating an execution plan(if join and subquery have the same execution plan created then they will be executed at the similar time)
select * from tblProducts2 p where not exists(select Id from tblProductSales2 where ProductId = p.Id);

checkpoint;
go
dbcc dropcleanbuffers; -- Clears query cache
go
dbcc freeproccache; -- Clears execution plan cache
go