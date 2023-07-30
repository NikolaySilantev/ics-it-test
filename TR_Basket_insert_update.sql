CREATE TRIGGER TR_Basket_insert_update  
ON dbo.Basket  
AFTER INSERT   
AS
	update dbo.Basket set DiscountValue = 0 where ID in (select id from inserted);
	update dbo.Basket set DiscountValue = Value*0.05 where ID_SKU in 
	(select ID_SKU from inserted group by ID_SKU having count(*) >= 2) 
	and ID in (select id from inserted);
GO  