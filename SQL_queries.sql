SELECT * FROM online_sales.online_sales;

/* Possible queries: 

1. Check most sold products (Description + Quantity)
2. Check total profit per month
3. Check country with more purchases
4. For tableau: Order date line graph 
5. Check returned status by product to see which product is the one the customers return the most and which the least 
6. Check which sales channel is the most common vs shipping cost? or order priority

*/

-- 1. Order products by most sold (Description + Quantity)

SELECT 
    `Description`, 
    SUM(`Quantity`) AS Total_Quantity_Sold
FROM 
    online_sales
WHERE 
    `Description` IS NOT NULL AND `Description` != '' -- Asegura que no hay valores vacíos
GROUP BY 
    `Description`
ORDER BY 
    Total_Quantity_Sold DESC;

-- 2: Total profit per month

SELECT 
    DATE_FORMAT(`Order Date`, '%Y-%m') AS Month, -- Group by month
    ROUND(SUM((`Quantity` * `Unit Price`) * (1 - (`Discount` / 100))), 2) AS Total_Profit
FROM 
    online_sales
GROUP BY 
    Month
ORDER BY 
    Month;


-- Another version: 

SELECT 
    DATE_FORMAT(`Order Date`, '%Y-%m') AS Month,
    `Country`,
    `Description`,
    ROUND(SUM((`Quantity` * `Unit Price`) * (1 - (`Discount` / 100))),2) AS Total_Profit
FROM 
    online_sales
GROUP BY 
    Month, `Country`, `Description`
ORDER BY 
    Month, Total_Profit DESC;


-- Check country with more quantity of purchases: 

SELECT 
    `Country`, 
    SUM(`Quantity`) AS Total_Quantity
FROM 
    online_sales
GROUP BY 
    `Country`
ORDER BY 
    Total_Quantity DESC
LIMIT 1;


-- Country spent (desc)

SELECT `Country`, 
SUM(`Unit Price` * `Quantity`) AS Total_Spent 
FROM online_sales
GROUP BY `Country`
ORDER BY Total_Spent DESC; 

-- Top 3 most returned products

SELECT 
    `Description`, 
    SUM(Quantity) AS total_returned
FROM online_sales
WHERE `Return Status` = 'Returned'
GROUP BY `Description`
ORDER BY total_returned DESC
LIMIT 3;

-- Top 3 least returned products: 

SELECT 
    `Description`, 
    SUM(Quantity) AS total_not_returned
FROM online_sales
WHERE `Return Status` = 'Returned'
GROUP BY `Description`
ORDER BY total_not_returned ASC
LIMIT 3;

-- Which payment method is used the most? 

SELECT `Payment Method`, total_sales
FROM (
    SELECT `Payment Method`, SUM(Quantity) AS total_sales
    FROM online_sales
    GROUP BY `Payment Method`
) AS sales_summary
ORDER BY total_sales DESC;

-- CTE: Total revenue per sales channel

WITH Profit_CTE AS (
    SELECT 
        `Sales Channel`, 
        SUM(Quantity * `Shipping Cost`) AS total_revenue
    FROM online_sales
    GROUP BY `Sales Channel`
)
SELECT * FROM Profit_CTE
ORDER BY total_revenue DESC;

-- 
WITH Sales_CTE AS (
    SELECT `Sales Channel`, COUNT(*) AS total_orders
    FROM online_sales
    GROUP BY `Sales Channel`
)
	SELECT 
    o.`Sales Channel` AS online_sales_channel, 
    o.total_orders AS online_orders,
    f.total_orders AS offline_orders,
    ROUND(((o.total_orders - f.total_orders) / f.total_orders) * 100, 2) AS percentage_growth
FROM Sales_CTE o
JOIN Sales_CTE f ON o.`Sales Channel` = 'Online' AND f.`Sales Channel` = 'Offline';

-- Check top 10 customer ID with more purchases (excluding customer ID 0)

SELECT `Customer ID`, 
       SUM((`Quantity` * `Unit Price`) - `Discount` + `Shipping Cost`) AS total_spent
FROM online_sales
WHERE `Customer ID` <> 0
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 10;

-- Checking Total Revenue, AOV, Order Count & Avg Discount by Order Priority

SELECT 
    `Order Priority`, 
    COUNT(*) AS `total orders`, 
    SUM((`Quantity` * `Unit Price`) - `Discount` + `Shipping Cost`) AS `total revenue`, 
    AVG((`Quantity` * `Unit Price`) - `Discount` + `Shipping Cost`) AS `avg order value`, 
    AVG(`Discount`) AS `avg discount`, 
    AVG(`Shipping Cost`) AS `avg shipping cost`
FROM online_sales
GROUP BY `Order Priority`
ORDER BY `total revenue` DESC;

-- 