-- Question: How have sales changed by year and by month? Is there a busy season?
-- Show: year, month, total sales, number of orders.
-- Concepts: strftime('%Y', order_date), strftime('%m', order_date), COUNT(DISTINCT ...)
-- Note: one order can have many rows, so count orders with COUNT(DISTINCT order_id).

-- Your query here:

SELECT 
    strftime('%Y', order_date) AS year, 
    strftime('%m', order_date) AS month, 
    SUM(sales) AS total_sales, 
    COUNT(DISTINCT order_id) AS number_of_orders
FROM
    superstore_sales
GROUP BY
    year, month
ORDER BY
    year, month