-- Question 1: Rank products by sales WITHIN each category (top 3 per category).
-- Concepts: RANK() OVER (PARTITION BY ... ORDER BY ...), subquery or CTE (WITH ...)

-- Your query here:
SELECT 
    category, 
    product_name, 
    SUM(sales) AS total_sales,
    RANK() OVER (PARTITION BY category ORDER BY SUM(sales) DESC) AS sales_rank
FROM
    superstore_sales
GROUP BY
    category, product_name

-- Question 2: Show monthly sales with a running (cumulative) total.
-- Concepts: SUM(...) OVER (ORDER BY ...)

-- Your query here:

SELECT 
    strftime('%Y', order_date) AS year, 
    strftime('%m', order_date) AS month, 
    SUM(sales) AS monthly_sales,
    SUM(SUM(sales)) OVER (ORDER BY strftime('%Y', order_date), strftime('%m', order_date)) AS running_total_sales
FROM
    superstore_sales
GROUP BY  
    year, month