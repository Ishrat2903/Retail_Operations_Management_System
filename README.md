# Retail Operations Management System

## Project Overview

The Retail Operations Management System is a relational database project developed using MySQL. The system is designed to manage and analyse retail sales data from products and customer transactions.

The project transforms raw product and transaction datasets into a structured and normalized relational database. It also demonstrates CRUD operations and SQL queries that provide useful business insights such as revenue by outlet, popular products, payment methods, category performance, loyalty card usage, and daily revenue.

## Technologies Used

- MySQL
- SQL
- Git & GitHub
- CSV datasets
- MySQL Workbench

## Database Structure

The database is called:

`retail_management_db`

The main tables are:

- **Categories** – Stores product categories.
- **Outlets** – Stores outlet information.
- **Payment_Methods** – Stores available payment methods.
- **Products** – Stores product details, prices, variants, and categories.
- **Transactions** – Stores transaction-level information such as date, time, outlet, payment method, sales, tax, and total amount.
- **Transaction_Items** – Stores the products included in each transaction, including quantity and unit price.

### Staging Tables

Two additional staging tables are used to initially load the raw datasets:

- `Raw_Products`
- `Raw_Transactions`

The raw data is then transformed and distributed into the normalized relational tables.

## Project Workflow

The project follows these main steps:

1. Create the retail management database.
2. Create the relational tables based on the database design.
3. Load the original CSV datasets into staging tables.
4. Transform and normalize the raw data.
5. Populate the relational tables using SQL `INSERT`, `DISTINCT`, and `JOIN` operations.
6. Split transaction items into individual records using a recursive CTE.
7. Perform CRUD operations.
8. Execute basic SQL queries.
9. Execute business-oriented SQL queries to analyse the retail data.
10. Use a transaction summary view to provide commonly required transaction information.

## Repository Structure

```text
Retail_Operations_Management_System/
│
├── Data/
│   ├── Products.csv
│   └── Transactions.csv
│
├── Scripts/
│   ├── 1_Create_Schema.sql
│   ├── 2_Database_Tables.sql
│   ├── 3_Raw_Data_Staging_Table.sql
│   ├── 4_Import_data.sql
│   ├── 5_Populating_data.sql
│   ├── 6_SQL_Queries.sql
│   ├── 7_CRUD_operation.sql
│   └── 8_Business_Questions.sql
│
├── .gitignore
├── LICENSE
└── README.md
```

## How to Run the Project

The project can be run using **MySQL Workbench**.

### 1. Clone the Repository

Open Terminal and navigate to the location where you want to save the project.

Clone the repository using:

```bash
git clone git@github.com:Ishrat2903/Retail_Operations_Management_System.git
```

Then enter the project folder:

```bash
cd Retail_Operations_Management_System
```

Alternatively, the repository can be downloaded as a ZIP file from GitHub and extracted locally.

### 2. Open MySQL Workbench

Open MySQL Workbench and connect to a MySQL server.

### 3. Open the SQL Scripts

The SQL scripts are located inside the `Scripts` folder.

Run the scripts in the following order:

1. `1_Create_Schema.sql`
2. `2_Database_Tables.sql`
3. `3_Raw_Data_Staging_Table.sql`
4. `4_Import_data.sql`
5. `5_Populating_data.sql`
6. `6_SQL_Queries.sql`
7. `7_CRUD_operation.sql`
8. `8_Business_Questions.sql`

The order is important because later scripts depend on the database objects and data created by earlier scripts.

### 4. Import the Datasets

The CSV datasets are included in the `Data` folder:

- `Data/Products.csv`
- `Data/Transactions.csv`

The `4_Import_data.sql` script loads these datasets into the following staging tables:

- `Raw_Products`
- `Raw_Transactions`

The data is imported using `LOAD DATA LOCAL INFILE`.

#### Important: Local File Path

`LOAD DATA LOCAL INFILE` uses a file path on the computer running MySQL Workbench. Therefore, the file paths in `4_Import_data.sql` may need to be changed to match the location where the repository was cloned or downloaded.

For example, the files are located inside the project at:

```text
Retail_Operations_Management_System/Data/Products.csv
Retail_Operations_Management_System/Data/Transactions.csv
```

The exact file path depends on the user's local computer and where the repository is stored.

If MySQL Workbench reports that local file loading is disabled, `local_infile` may need to be enabled before running the import script.

### 5. Populate the Database

After importing the raw datasets, run:

```text
5_Populating_data.sql
```

This script transforms the staging data and populates the normalized tables.

The script also processes the comma-separated product information from the transaction data and inserts individual products into the `Transaction_Items` table.

### 6. Run Basic SQL Queries

Run:

```text
6_SQL_Queries.sql
```

This script demonstrates basic SQL operations including:

- `SELECT`
- `WHERE`
- `DISTINCT`
- `ORDER BY`
- `COUNT`
- `GROUP BY`
- `HAVING`
- `SUM`
- `AVG`
- `MIN`
- `MAX`

### 7. Test CRUD Operations

Run:

```text
7_CRUD_operation.sql
```

This script demonstrates the basic CRUD operations:

- **Create**
- **Read**
- **Update**
- **Delete**

These operations are used to test basic data management within the database.

### 8. Run Business Queries

Run:

```text
8_Business_Questions.sql
```

These queries analyse the retail data and provide business-oriented information such as:

- Revenue by outlet
- Popular products
- Product and category revenue
- Payment method usage
- Loyalty card usage
- Daily revenue
- Average transaction value

### 9. Verify the Database

After executing the scripts, refresh the `retail_management_db` schema in MySQL Workbench.

The database should contain the main relational tables, staging tables, and the `Transaction_Summary` view.

The project can then be used to explore the data and execute the SQL queries provided in the `Scripts` folder.

