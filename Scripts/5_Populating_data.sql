-- ******************************************************
-- Populating data into Normalised Tables
--  and splitting the raw data into separate tables
-- to achieve Third Normal Form (3NF)
-- ******************************************************

INSERT INTO Categories(Category_Name)
SELECT DISTINCT Category 
FROM Raw_Products;

SELECT * FROM Categories;


INSERT INTO Outlets(Outlet_Code)
SELECT DISTINCT Outlet 
FROM Raw_Transactions;

SELECT * FROM Outlets;


INSERT INTO Payment_Methods(Payment_Method_Name)
SELECT DISTINCT PaymentMethod 
FROM Raw_Transactions;

SELECT * FROM Payment_Methods;


INSERT INTO Products(Product_ID, Product_Name, Variant, Price, Product_Description, Category_ID)
SELECT DISTINCT ProductId, ProductName, Variant, Price, Description, Categories.Category_ID
FROM Raw_Products
INNER JOIN Categories ON Raw_Products.Category = Categories.Category_Name;

SELECT * FROM Products;
SELECT COUNT(*) FROM Products;


INSERT INTO Transactions(Receipt_Number, Transaction_Date, Transaction_Time, Outlet_ID, Payment_Method_ID, Net_Sales, Tax, Total_Amount, Total_Items, Loyalty_Card_Used)
SELECT ReceiptNumber, Date, Time, Outlets.Outlet_ID, Payment_Methods.Payment_Method_ID, NetSales, Tax, TotalAmount, TotalItem, UseLoyaltyCard
FROM Raw_Transactions
INNER JOIN Outlets ON Raw_Transactions.Outlet = Outlets.Outlet_Code
INNER JOIN Payment_Methods ON Raw_Transactions.PaymentMethod = Payment_Methods.Payment_Method_Name;

SELECT * FROM Transactions;
SELECT COUNT(*) FROM Transactions;

-- ******************************************************
-- Creating Atomic Transaction Items
-- Splitting multi-valued product data to achieve 1NF
-- ******************************************************

INSERT INTO Transaction_Items (Transaction_ID, Product_ID, Quantity, Unit_Price)

WITH RECURSIVE SplitValues AS (
SELECT ReceiptNumber, TRIM(SUBSTRING_INDEX(Items, ',', 1)) AS split_value,
IF(LOCATE(',', Items) > 0, SUBSTRING(Items, LOCATE(',', Items) + 1), NULL) AS remaining_values
FROM Raw_Transactions

UNION ALL

SELECT ReceiptNumber, TRIM(SUBSTRING_INDEX(remaining_values, ',', 1)),
IF(LOCATE(',', remaining_values) > 0, SUBSTRING(remaining_values, LOCATE(',', remaining_values) + 1), NULL)
FROM SplitValues
WHERE remaining_values IS NOT NULL
)

SELECT t.Transaction_ID, p.Product_ID, 1 AS Quantity, p.Price AS Unit_Price
FROM SplitValues AS s
INNER JOIN Transactions AS t
ON s.ReceiptNumber = t.Receipt_Number
INNER JOIN Products AS p
ON s.split_value =
CASE
WHEN p.Variant IS NULL OR p.Variant = ''
THEN p.Product_Name
ELSE CONCAT(p.Product_Name, ' (', p.Variant, ')')
END;

SELECT COUNT(*) FROM Transaction_Items;
SELECT * FROM Transaction_Items;

SELECT SUM(Quantity)
FROM Transaction_Items;

SELECT SUM(Total_Items)
FROM Transactions;

-- *************************************************************
-- Creating View for Transaction_Summary from Transactions table
-- *************************************************************

CREATE VIEW Transaction_Summary AS
SELECT 
    t.Transaction_ID,
    t.Receipt_Number,
    t.Transaction_Date,
    o.Outlet_Code,
    p.Payment_Method_Name,
    t.Total_Amount,
    t.Total_Items
FROM Transactions t
INNER JOIN Outlets o 
    ON t.Outlet_ID = o.Outlet_ID
INNER JOIN Payment_Methods p 
    ON t.Payment_Method_ID = p.Payment_Method_ID;
    
SELECT * FROM Transaction_Summary;
