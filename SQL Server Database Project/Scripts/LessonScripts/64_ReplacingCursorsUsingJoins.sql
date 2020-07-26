update tblProductSales2 set UnitPrice = 
case
	when p.Name = 'Product - 55' then 55
	when p.Name = 'Product - 65' then 65
	when p.Name like 'Product - 100%' then 100
end
from tblProductSales2 s join tblProducts2 p on s.ProductId = p.Id where Name = 'Product - 55' or Name = 'Product - 65' or Name like 'Product - 100%';

update tblProductSales2 set UnitPrice = 
case
	when p.Name = 'Product - 55' then 55
	when p.Name = 'Product - 65' then 65
	when p.Name like 'Product - 100%' then 100
	else UnitPrice -- When we remove where clause and conditions in case block arent match then we need to specify default block so values wont get updated as NULL;
end
from tblProductSales2 s join tblProducts2 p on s.ProductId = p.Id;