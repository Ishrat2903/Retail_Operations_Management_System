-- ******************************************************
-- Creating Tables based on ERD
-- ******************************************************
CREATE TABLE Categories (
	Category_ID INT AUTO_INCREMENT PRIMARY KEY,
    Category_Name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Outlets (
	Outlet_ID INT AUTO_INCREMENT PRIMARY KEY,
    Outlet_Code VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Payment_Methods (
	Payment_Method_ID INT AUTO_INCREMENT PRIMARY KEY,
    Payment_Method_Name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Products (
	Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name VARCHAR(50) NOT NULL,
    Variant VARCHAR(50),
    Price DECIMAL(10,2) NOT NULL,
    Product_Description VARCHAR(200) NOT NULL,
    Category_ID INT NOT NULL,
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
);


CREATE TABLE Transactions (
	Transaction_ID INT AUTO_INCREMENT PRIMARY KEY,
    Receipt_Number VARCHAR(50) NOT NULL UNIQUE,
    Transaction_Date DATE NOT NULL,
    Transaction_Time TIME NOT NULL,
	Outlet_ID INT NOT NULL,
    FOREIGN KEY (Outlet_ID) REFERENCES Outlets(Outlet_ID),
    Payment_Method_ID INT NOT NULL,
    FOREIGN KEY (Payment_Method_ID) REFERENCES Payment_Methods(Payment_Method_ID),
    Net_Sales DECIMAL(8,3) NOT NULL,
    Tax DECIMAL(8,3) NOT NULL,
    Total_Amount decimal(8,3) NOT NULL,
    Total_Items INT NOT NULL,
    Loyalty_Card_Used BOOLEAN NOT NULL
);


CREATE TABLE Transaction_Items (
	Transaction_Item_ID INT AUTO_INCREMENT PRIMARY KEY,
    Transaction_ID INT NOT NULL,
    FOREIGN KEY (Transaction_ID) REFERENCES Transactions(Transaction_ID),
    Product_ID INT NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(8,3) NOT NULL
);

SHOW TABLES;
