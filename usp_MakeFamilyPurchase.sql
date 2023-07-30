use dbo;
go
create procedure GetProductDesc
(
	@FamilySurName varchar(255)
)
as
begin
	declare @ValueSum money;
	set @ValueSum = (select sum(value) 
		from Basket inner join Family on Basket.ID_Family=Family.ID 
		where SurName=@FamilySurName);
	if @ValueSum is not null
		update Family
		set BudgetValue = BudgetValue - @ValueSum
		where SurName=@FamilySurName
	else
		print('Error: Surname ' + @FamilySurName + ' does not exists' )
end