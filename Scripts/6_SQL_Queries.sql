-- *******************************
-- SQL Queries
-- *******************************

-- **************
-- 1. SELECT
-- **************

-- Display Products
SELECT * FROM Products LIMIT 20;

-- Display Transactions
SELECT * FROM Transactions LIMIT 20;

-- Display Categories
SELECT * FROM Categories LIMIT 20;

-- Display Outlets
SELECT * FROM Outlets LIMIT 20;

-- Display Payment Methods
SELECT * FROM Payment_Methods LIMIT 20;

-- Display Transaction Items
SELECT * FROM Transaction_Items LIMIT 20;

-- **************
-- 2. WHERE
-- **************
SELECT Product_Name, Price
FROM Products
WHERE Price > 10000;

-- **************
-- 3. DISTINCT
-- **************
SELECT DISTINCT Category_Name
FROM Categories;

-- **************
-- 4. ORDER BY
-- **************
SELECT Product_Name, Price
FROM Products
ORDER BY Price DESC;

-- **************
-- 5. COUNT
-- **************
SELECT COUNT(*) AS Total_Products
FROM Products;

-- **************
-- 6. GROUP BY
-- **************
SELECT Category_ID, COUNT(*) AS Number_of_Products
FROM Products
GROUP BY Category_ID;

-- **************
-- 7. HAVING
-- **************
SELECT Category_ID, COUNT(*) AS Number_of_Products
FROM Products
GROUP BY Category_ID
HAVING COUNT(*) > 10;

-- ******************
-- 8. SUM + GROUP BY
-- ******************
SELECT Outlet_ID, SUM(Total_Amount) AS Total_Revenue
FROM Transactions
GROUP BY Outlet_ID;

-- **************
-- 9. AVG
-- **************
SELECT AVG(Total_Amount) AS Average_Transaction
FROM Transactions;

-- *****************
-- 10. MIN and MAX
-- *****************
SELECT MIN(Price) AS Lowest_Price,
       MAX(Price) AS Highest_Price
FROM Products;