-- Question: Which products lose money overall? Does discount have something to do with it?
-- Show: product_name, total profit, average discount. Only products with negative total profit.
-- Concepts: HAVING, AVG, CASE WHEN (bonus: group rows into discount bands like 0%, 1-20%, 21-40%, 40%+)

-- Your query here:

SELECT 
    product_name, 
    SUM(profit) AS total_profit, 
    AVG(discount) AS average_discount
FROM
    superstore_sales
GROUP BY
    product_name
HAVING
    SUM(profit) < 0