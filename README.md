# 📁 SQL Project: Northwind Database Analysis

This project explores various **Structured Query Language (SQL)** concepts using the **SQLite Northwind Sample Database**. The goal is to practice essential database operations, joins, aggregations, subqueries, and database optimization techniques.

---

## 📝 Project Overview

The core of this project is the `sql_query.sql` file, which contains a series of progressively complex SQL queries executed against the Northwind database. The queries are categorized below by the SQL concept they demonstrate.

---

## 🛠️ Prerequisites

* **Database:** **Northwind Sample Database** (SQLite version).
* **Database Engine:** **SQLite** (or a compatible environment).
* **SQL Client:** A tool like **DB Browser for SQLite** or a command-line interface to execute the `.sql` script and view the results.

---

## 💡 Key SQL Concepts Demonstrated

The `sql_query.sql` file covers the following essential SQL functionalities:

### 1. Basic Filtering and Ordering (`SELECT`, `WHERE`, `ORDER BY`)

* **Query 1:** Retrieves customer information, filtering by the **'USA' Country** and ordering results by **City**.

### 2. Joins (`INNER JOIN`, `LEFT JOIN`)

* **Query 3 (INNER JOIN):** Combines `Order` and `Customer` tables to link orders with the corresponding **company name** and order date.
* **Query 4 (LEFT JOIN):** Lists all products and their categories, ensuring **all products** are included, even if a category ID is missing.
* **Query 5 (Simulated RIGHT JOIN):** A technique used in SQLite (`LEFT JOIN` on reversed tables) to list **all categories** and their associated products.

### 3. Aggregation and Grouping (`COUNT`, `SUM`, `AVG`, `GROUP BY`, `HAVING`)

* **Query 2:** Calculates the **total number of orders** placed by each customer.
* **Query 7:** Calculates the **total revenue** for each individual order (`Quantity * UnitPrice`).
* **Query 8 (`HAVING`):** Filters aggregated results to identify **High Value Orders** (Total Amount > $1000).
* **Query 10:** Determines the **average unit price** of products supplied by each company.

### 4. Advanced Techniques (`Subqueries`, `Views`)

* **Query 6 (Subquery):** Finds products whose `UnitPrice` is **greater than the overall average unit price** of all products.
* **Query 8 (CREATE VIEW):** Defines a reusable virtual table named `HighValueOrders` for frequently needed complex results.

### 5. Database Optimization

* **Query 9 (CREATE INDEX):** Creates an index (`idx_orderdetail_orderid`) on `OrderDetail.OrderId` to **optimize performance** for join operations.
