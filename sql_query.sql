CREATE DATABASE Superstore;
USE Superstore;

CREATE TABLE saless (
 order_id VARCHAR(30),
 order_date DATE, 
 ship_mode VARCHAR(50),
 customer_name VARCHAR(100),
 segment VARCHAR(50),
 city VARCHAR(100),
 state VARCHAR(100),
 region VARCHAR(50),
 category VARCHAR(50),
 sub_category VARCHAR(100),
 sales DECIMAL(10,4),
 quantity INT,
 discount DECIMAL(5,2),
 profit DECIMAL(10,4) 
 );

-- View Data
SELECT * FROM saless;

-- exported the csv file using table data import wizard

-- 1: Total Sales

SELECT SUM(sales) AS Total_Sales FROM saless;

-- 2: Total Profit

SELECT SUM(profit) AS Total_Profit FROM saless;

-- 3: Monthly Sales Analysis

SELECT MONTH(order_date) AS Month, SUM(sales) AS Monthly_Sales FROM saless
GROUP BY MONTH(order_date) ORDER BY Month;

-- 4: Category Wise Sales

SELECT Category, SUM(sales) AS Total_Sales FROM saless
GROUP BY category ORDER BY Total_Sales DESC;

--  5: Sub Category Analysis

SELECT sub_category, SUM(sales) AS Total_Sales FROM saless
GROUP BY sub_category ORDER BY Total_Sales DESC;

-- 6: Region Wise Profit

SELECT region, SUM(profit) AS Total_Profit FROM saless
GROUP BY region ORDER BY Total_Profit DESC;

-- 7: Discount vs Profit

SELECT discount, AVG(profit) AS Avg_Profit FROM saless
GROUP BY discount ORDER BY discount;

