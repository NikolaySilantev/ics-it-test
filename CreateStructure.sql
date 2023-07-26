create table SKU
	(
		ID int identity(1,1) primary key, 
		CODE as cast('s' as varchar(1)) + cast(ID as varchar(10))  unique , 
		name varchar(20)
	);

create table Family
	(
		ID int identity(1,1) primary key, 
		SurName varchar(20), 
		BudgetValue money
	);

create table Basket 
	(
		ID int identity(1,1) primary key, 
		ID_SKU int references SKU(ID), 
		ID_Family int references Family(ID),
		Quantity int check (Quantity >= 0),
		Value money check (Value >= 0),
		PurchaseDate datetime DEFAULT getdate(),
		DiscountValue money
	);
