use dbo;
go
create function GetSKUPrice (@ID_SKU int)
    returns decimal(18, 2)
    begin
		declare @cost decimal(18, 2)
        select @cost = sum(Value)/sum(Quantity) from Basket where ID_SKU = @ID_SKU
		return @cost
    end;