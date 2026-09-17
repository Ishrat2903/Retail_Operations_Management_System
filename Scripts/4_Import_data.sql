-- ******************************************************
-- importing dataset
-- ******************************************************

SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';

LOAD DATA LOCAL INFILE 'Data/Products.csv'	 	-- Please add the correct file path in order to import the dataset.
INTO TABLE Raw_Products
FIELDS TERMINATED BY ';'  -- CSV delimiter
ENCLOSED BY '"'           -- Enclosing character for text (optional)
LINES TERMINATED BY '\n'  -- New line to mark each record
IGNORE 1 LINES            -- Ignore the first row (header)
(ProductId, ProductName, Variant, Category, Price, Description);

SELECT * FROM Raw_Products;
SELECT COUNT(*) FROM Raw_Products;


LOAD DATA LOCAL INFILE 'Data/Transactions.csv'	 	-- Please add the correct file path in order to import the dataset.
INTO TABLE Raw_Transactions
FIELDS TERMINATED BY ','  -- CSV delimiter
ENCLOSED BY '"'           -- Enclosing character for text (optional)
LINES TERMINATED BY '\n'  -- New line to mark each record
IGNORE 1 LINES            -- Ignore the first row (header)
(Outlet, Date, Time, NetSales, Tax, TotalAmount, ReceiptNumber, Items, TotalItem, PaymentMethod, UseLoyaltyCard);

SELECT * FROM Raw_Transactions;
SELECT COUNT(*) FROM Raw_Transactions;
