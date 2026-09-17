-- *******************************
-- CRUD OPERATION
-- *******************************

-- ***************
-- Create
-- ***************

INSERT INTO Products(Product_Name, Variant, Price, Product_Description, Category_ID) VALUES('Coconut Mango LULU', 'Ice', 15000, 'Coconut Mango shake with a choice of jelly.', 8);

-- ***************
-- Read
-- ***************
SELECT * FROM Products 
WHERE Product_Name = 'Coconut Mango LULU';

-- ***************
-- Update
-- ***************
UPDATE Products 
SET Price = 20000
WHERE Product_ID = 107;       -- Please enter the correct ID from the read section
SELECT * FROM Products WHERE Product_Name = 'Coconut Mango LULU';

-- ***************
-- Delete
-- ***************
DELETE FROM Products
WHERE Product_ID = 107;       -- Please enter the correct ID from the read section

SELECT * FROM Products;
