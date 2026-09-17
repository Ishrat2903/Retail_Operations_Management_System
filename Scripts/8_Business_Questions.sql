-- *******************************
-- BUSINESS QUESTIONS
-- *******************************


-- QUESTION 1: Which Outlet generates the highest revenue?
-- From the output it has been identified that, Outlet 1 is making the highest revenue.

SELECT Outlet_ID, SUM(Total_Amount) AS Total_Revenue
FROM Transactions
GROUP BY Outlet_ID
ORDER BY Total_Revenue DESC;


-- QUESTION 2: What are the top 10 popular Products by units sold?
-- Output shows the top 3 Popular Products are Friendly Coffee, Americano and Basic Latte.

SELECT Products.Product_Name, SUM(Transaction_Items.Quantity) AS Units_Sold
FROM Transaction_Items
INNER JOIN Products
ON Transaction_Items.Product_ID = Products.Product_ID
GROUP BY Products.Product_Name
ORDER BY Units_Sold DESC
LIMIT 10;


-- QUESTION 3: Which Payment Mode is used most by the consumers?
-- According to the result, BCA is the most used Payment Mode and GoFood is the least.

SELECT Payment_Methods.Payment_Method_Name, COUNT(Transactions.Receipt_Number) AS Number_of_Transactions
FROM Transactions
INNER JOIN Payment_Methods
ON Transactions.Payment_Method_ID = Payment_Methods.Payment_Method_ID
GROUP BY Payment_Methods.Payment_Method_Name
ORDER BY Number_of_Transactions DESC;


-- QUESTION 4: Which Category has the most Products?
-- Results displays, Coffee has the highest number of Products.

SELECT Categories.Category_Name, COUNT(Products.Category_ID) AS Number_of_Products
FROM Products
INNER JOIN Categories
ON Products.Category_ID = Categories.Category_ID
GROUP BY Categories.Category_Name
ORDER BY Number_of_Products DESC;


-- QUESTION 5: Which Category generates the highest revenue?
-- According to the result, Coffee has the highest revenue, followed by Menu Gedhe.

SELECT Categories.Category_Name, SUM(Transaction_Items.Quantity * Transaction_Items.Unit_Price) AS Category_Revenue
FROM Transaction_Items
INNER JOIN Products
ON Transaction_Items.Product_ID = Products.Product_ID
INNER JOIN Categories
ON Products.Category_ID = Categories.Category_ID
GROUP BY Categories.Category_Name
ORDER BY Category_Revenue DESC;


-- QUESTION 6: Which products generate the highest revenue?
-- Top 3 revenue generating products are Friendly Coffee, WHITE and Basic Latte, based on the results.

SELECT Products.Product_Name, SUM(Transaction_Items.Quantity * Transaction_Items.Unit_Price) AS Product_Revenue
FROM Transaction_Items
INNER JOIN Products
ON Transaction_Items.Product_ID = Products.Product_ID
GROUP BY Products.Product_Name
ORDER BY Product_Revenue DESC
LIMIT 10;


-- QUESTION 7: How many transactions used the loyalty card?
-- Output shows, 1733 trasaction was made by loyalty card.

SELECT 
    CASE 
        WHEN Loyalty_Card_Used = 1 THEN 'Yes'
        ELSE 'No'
    END AS Loyalty_Card,
    COUNT(*) AS Number_of_Transactions
FROM Transactions
GROUP BY Loyalty_Card_Used;


-- QUESTION 8: What is the revenue generated per day?
-- The result shows the revenue varies between different dates allowing business owners to identify higher or lower sales.

SELECT Transaction_Date, SUM(Total_Amount) AS Daily_Revenue
FROM Transactions
GROUP BY Transaction_Date
ORDER BY Transaction_Date;


-- QUESTION 9: What is the average transaction value?
-- Average transaction value so far is 24488.42, based on the outcome.

SELECT AVG(Total_Amount) AS Average_Transaction_Value
FROM Transactions;