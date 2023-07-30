create view vw_SKUPrice as
select ID, CODE, name, dbo.GetSKUPrice(ID) as cost from dbo.SKU;