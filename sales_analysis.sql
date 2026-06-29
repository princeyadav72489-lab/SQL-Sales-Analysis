-- SQL Sales Data Analysis
-- Dataset: Sample - Superstore
-- Database: salesdb
-- Author: Prince Yadav

USE salesdb;

-- Explore the dataset

SHOW TABLES;

DESCRIBE superstore;

SELECT *
FROM superstore
LIMIT 10;

SELECT COUNT(*) AS TotalRecords
FROM superstore;

-- WHERE clause

SELECT *
FROM superstore
WHERE Region = 'West';

SELECT *
FROM superstore
WHERE Category = 'Furniture';

SELECT *
FROM superstore
WHERE Sales > 500;

SELECT *
FROM superstore
WHERE Category = 'Technology';

SELECT *
FROM superstore
WHERE Segment = 'Consumer';

SELECT *
FROM superstore
WHERE Region = 'West'
AND Category = 'Technology';

SELECT *
FROM superstore
WHERE Sales BETWEEN 100 AND 500;

-- GROUP BY

SELECT Category,
       SUM(Sales) AS TotalSales
FROM superstore
GROUP BY Category;

SELECT Category,
       SUM(Quantity) AS TotalQuantity
FROM superstore
GROUP BY Category;

SELECT Region,
       AVG(Sales) AS AverageSales
FROM superstore
GROUP BY Region;

SELECT Category,
       SUM(Profit) AS TotalProfit
FROM superstore
GROUP BY Category;

SELECT Segment,
       SUM(Sales) AS TotalSales
FROM superstore
GROUP BY Segment;

-- ORDER BY and LIMIT

-- Top 10 products by sales
SELECT `Product Name`,
       SUM(Sales) AS TotalSales
FROM superstore
GROUP BY `Product Name`
ORDER BY TotalSales DESC
LIMIT 10;

-- Top 10 customers by sales
SELECT `Customer Name`,
       SUM(Sales) AS TotalSales
FROM superstore
GROUP BY `Customer Name`
ORDER BY TotalSales DESC
LIMIT 10;

-- Top 5 states by sales
SELECT State,
       SUM(Sales) AS TotalSales
FROM superstore
GROUP BY State
ORDER BY TotalSales DESC
LIMIT 5;

-- Top 10 products by profit
SELECT `Product Name`,
       SUM(Profit) AS TotalProfit
FROM superstore
GROUP BY `Product Name`
ORDER BY TotalProfit DESC
LIMIT 10;

-- Top categories by sales
SELECT Category,
       SUM(Sales) AS TotalSales
FROM superstore
GROUP BY Category
ORDER BY TotalSales DESC;

-- Business Queries

-- Monthly sales trend
SELECT
YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Year,
MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS Month,
SUM(Sales) AS TotalSales
FROM superstore
GROUP BY
YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')),
MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y'))
ORDER BY Year, Month;

-- Most ordered products
SELECT `Product Name`,
       SUM(Quantity) AS QuantitySold
FROM superstore
GROUP BY `Product Name`
ORDER BY QuantitySold DESC
LIMIT 10;

-- Highest discount by product
SELECT `Product Name`,
       MAX(Discount) AS HighestDiscount
FROM superstore
GROUP BY `Product Name`
ORDER BY HighestDiscount DESC;

-- Check duplicate Order ID + Product ID
SELECT `Order ID`,
       `Product ID`,
       COUNT(*) AS DuplicateCount
FROM superstore
GROUP BY `Order ID`, `Product ID`
HAVING COUNT(*) > 1;

-- 6. CASE Statement
SELECT
    `Customer Name`,
    SUM(Sales) AS Total_Sales,
    CASE
        WHEN SUM(Sales) >= 10000 THEN 'Premium Customer'
        WHEN SUM(Sales) >= 5000 THEN 'Regular Customer'
        ELSE 'Occasional Customer'
    END AS Customer_Type
FROM superstore
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;

-- Data Validation

SELECT COUNT(*) AS Total_Records
FROM superstore;

SELECT COUNT(*) AS Missing_Sales
FROM superstore
WHERE Sales IS NULL;

SELECT COUNT(*) AS Missing_Category
FROM superstore
WHERE Category IS NULL;

SELECT COUNT(*) AS Missing_Profit
FROM superstore
WHERE Profit IS NULL;

SELECT `Order ID`,
       `Product ID`,
       COUNT(*) AS Duplicate_Count
FROM superstore
GROUP BY `Order ID`, `Product ID`
HAVING COUNT(*) > 1;

SELECT MIN(Sales) AS Minimum_Sales,
       MAX(Sales) AS Maximum_Sales,
       AVG(Sales) AS Average_Sales
FROM superstore;
