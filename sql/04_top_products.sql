-- Question: What are the top 10 products by sales? And the top 10 by profit? Are they the same?
-- Concepts: GROUP BY, ORDER BY ... DESC, LIMIT

-- Query A (top 10 by sales):

SELECT 
    product_name, 
    SUM(sales) AS total_sales
FROM
    superstore_sales
GROUP BY
    product_name
ORDER BY
    total_sales DESC
LIMIT 10;

-- Query B (top 10 by profit):

SELECT 
    product_name, 
    SUM(sales) AS total_profit
FROM
    superstore_profit
GROUP BY
    product_name
ORDER BY
    total_profit DESC
LIMIT 10;