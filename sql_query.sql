-- 1. Basic SELECT with WHERE and ORDER BY
SELECT Id, CompanyName, City, Country
FROM Customer
WHERE Country = 'USA'
ORDER BY City;

-- 2. GROUP BY with aggregate (number of orders per customer)
SELECT CustomerId, COUNT(*) AS TotalOrders
FROM "Order"
GROUP BY CustomerId
ORDER BY TotalOrders DESC;

-- 3. INNER JOIN Orders with Customers to get company names and order dates
SELECT o.Id AS OrderID,
       c.CompanyName,
       o.OrderDate,
       o.ShipCountry
FROM "Order" o
INNER JOIN Customer c ON o.CustomerId = c.Id
ORDER BY o.OrderDate DESC
LIMIT 10;

-- 4. LEFT JOIN Products with Categories to see all products even if category is missing
SELECT p.ProductName,
       c.CategoryName
FROM Product p
LEFT JOIN Category c ON p.CategoryId = c.Id
LIMIT 10;

-- 5. RIGHT JOIN (simulate in SQLite using LEFT JOIN reversed)
-- show all categories with products (even if no products exist)
SELECT c.CategoryName,
       p.ProductName
FROM Category c
LEFT JOIN Product p ON p.CategoryId = c.Id
ORDER BY c.CategoryName;

-- 6. Subquery: products whose UnitPrice > average price of all products
SELECT ProductName, UnitPrice
FROM Product
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Product)
ORDER BY UnitPrice DESC;

-- 7. Aggregate with SUM: total revenue per order
SELECT o.Id AS OrderID,
       SUM(od.Quantity * od.UnitPrice) AS OrderTotal
FROM "Order" o
JOIN OrderDetail od ON o.Id = od.OrderId
GROUP BY o.Id
ORDER BY OrderTotal DESC
LIMIT 5;

-- 8. Create a view of high value orders (> 1000)
CREATE VIEW IF NOT EXISTS HighValueOrders AS
SELECT o.Id AS OrderID,
       c.CompanyName,
       SUM(od.Quantity * od.UnitPrice) AS TotalAmount
FROM "Order" o
JOIN OrderDetail od ON o.Id = od.OrderId
JOIN Customer c ON o.CustomerId = c.Id
GROUP BY o.Id, c.CompanyName
HAVING TotalAmount > 1000;

-- Query the view
SELECT * FROM HighValueOrders
ORDER BY TotalAmount DESC
LIMIT 5;

-- 9. Create an index to optimize join on OrderDetail.OrderId
CREATE INDEX IF NOT EXISTS idx_orderdetail_orderid ON OrderDetail(OrderId);

-- 10. Another aggregate example: average unit price per supplier
SELECT s.CompanyName AS Supplier,
       AVG(p.UnitPrice) AS AvgUnitPrice
FROM Supplier s
JOIN Product p ON s.Id = p.SupplierId
GROUP BY s.CompanyName
ORDER BY AvgUnitPrice DESC;