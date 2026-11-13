-- Question: How do sales and profit break down by category and sub-category?
-- Show: category, sub_category, total sales, total profit. Which sub-categories lose money?
-- Concepts: GROUP BY multiple columns, HAVING

-- Your query here:

SELECT 
    category, 
    sub_category, 
    SUM(sales) AS total_sales, 
    SUM(profit) AS total_profit
FROM
    superstore_sales
GROUP BY 
    category, 
    sub_category
HAVING
    SUM(profit) < 0
