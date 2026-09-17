# Retail Operations Management System

## Project Overview

The Retail Operations Management System is a relational database project developed using MySQL. The system is designed to manage and analyse retail sales data from products and customer transactions.

The project transforms raw product and transaction datasets into a structured and normalized relational database. It also demonstrates CRUD operations and SQL queries that provide useful business insights such as revenue by outlet, popular products, payment methods, category performance, loyalty card usage, and daily revenue.

## Technologies Used

- MySQL
- SQL
- Git & GitHub
- CSV datasets

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

Two additional tables are used to initially load the raw datasets:

- `Raw_Products`
- `Raw_Transactions`

The raw data is then transformed and distributed into the normalized tables.

## Project Workflow

The project follows these main steps:

1. Create the retail management database.
2. Create the relational tables based on the ERD.
3. Load the original CSV datasets into staging tables.
4. Transform and normalize the raw data.
5. Populate the relational tables using SQL `INSERT` and `JOIN` operations.
6. Split transaction items into individual records using a recursive CTE.
7. Perform CRUD operations.
8. Execute business-oriented SQL queries to analyse the retail data.


## Dataset

The project uses two CSV datasets:

- `Data/Products.csv`
- `Data/Transactions.csv`

The datasets are loaded into the staging tables before being transformed into the final relational database structure.
