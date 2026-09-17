-- ******************************************************
-- Creating Staging Tables using the original database
-- ******************************************************

CREATE TABLE Raw_Products (
	ProductId INT,
	ProductName VARCHAR(50) NOT NULL,
	Variant VARCHAR(50),
	Category VARCHAR(50) NOT NULL,
	Price INT NOT NULL,
	DESCRIPTION VARCHAR(200) NOT NULL
);

CREATE TABLE Raw_Transactions (
	Outlet VARCHAR(20) NOT NULL,
	Date DATE NOT NULL,
	Time TIME NOT NULL,
	NetSales DECIMAL(8,3) NOT NULL,
	Tax DECIMAL(8,3) NOT NULL,
	TotalAmount  INT NOT NULL,
	ReceiptNumber VARCHAR(30) NOT NULL,
	Items VARCHAR(100) NOT NULL,
	TotalItem INT NOT NULL,
	PaymentMethod VARCHAR(30) NOT NULL,
	UseLoyaltyCard BOOLEAN NOT NULL
);
