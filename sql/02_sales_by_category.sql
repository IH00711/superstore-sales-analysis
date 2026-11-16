-- Question: How do sales and profit break down by category and sub-category?
-- Show: category, sub_category, total sales, total profit. Which sub-categories lose money?
-- Concepts: GROUP BY multiple columns, HAVING

-- Your query here:

-- Query A: full breakdown, most profitable first
SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM
    orders
GROUP BY
    category,
    sub_category
ORDER BY
    total_profit DESC;

-- Query B: only the sub-categories that lose money overall
SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM
    orders
GROUP BY
    category,
    sub_category
HAVING
    SUM(profit) < 0
ORDER BY
    total_profit ASC;

-- Result A (17 rows):
-- category         sub_category  total_sales  total_profit
-- Technology       Copiers       149528.03    55617.82
-- Technology       Phones        330007.05    44515.73
-- Technology       Accessories   167380.32    41936.64
-- Office Supplies  Paper         78479.21     34053.57
-- Office Supplies  Binders       203412.73    30221.76
-- Furniture        Chairs        328449.10    26590.17
-- Office Supplies  Storage       223843.61    21278.83
-- Office Supplies  Appliances    107532.16    18138.01
-- Furniture        Furnishings   91705.16     13059.14
-- Office Supplies  Envelopes     16476.40     6964.18
-- Office Supplies  Art           27118.79     6527.79
-- Office Supplies  Labels        12486.31     5546.25
-- Technology       Machines      189238.63    3384.76
-- Office Supplies  Fasteners     3024.28      949.52
-- Office Supplies  Supplies      46673.54     -1189.10
-- Furniture        Bookcases     114880.00    -3472.56
-- Furniture        Tables        206965.53    -17725.48

-- Result B:
-- category         sub_category  total_sales  total_profit
-- Furniture        Tables        206965.53    -17725.48
-- Furniture        Bookcases     114880.00    -3472.56
-- Office Supplies  Supplies      46673.54     -1189.10

-- Finding: Copiers are the most profitable sub-category ($55.6k profit on $150k sales).
-- 3 sub-categories lose money. Tables is the worst: about $207k in sales but a $17.7k loss.
-- Furniture has 2 of the 3 losers, so its pricing or discounts are worth a closer look.
