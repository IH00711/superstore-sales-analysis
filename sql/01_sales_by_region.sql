-- Question: Which regions generate the most sales and profit?
-- Show: region, total sales, total profit, profit margin (%). Sort by total sales, highest first.
-- Concepts: SUM, GROUP BY, ORDER BY, ROUND

-- Your query here:

-- Worked example. Read the comments; use this as a template for files 02-06.
-- SQL runs the clauses in this order: FROM -> GROUP BY -> SELECT -> ORDER BY.

SELECT
    region,                                            -- the column we group by
    ROUND(SUM(sales), 2)                    AS total_sales,       -- add up sales, round to 2 decimals
    ROUND(SUM(profit), 2)                   AS total_profit,      -- add up profit
    ROUND(SUM(profit) * 100.0 / SUM(sales), 1) AS profit_margin_pct  -- profit as % of sales
FROM orders                                            -- the table (created by load_to_sqlite.py)
GROUP BY region                                        -- one result row per region
ORDER BY total_sales DESC;                             -- biggest first (ASC = smallest first)

-- Why "* 100.0" and not "* 100"? The ".0" forces decimal maths.
-- Why SUM(profit) / SUM(sales) and not AVG(profit / sales)? The first weights big orders
-- more, which is the region's real margin. AVG would treat a $2 order the same as a $2,000 one.

-- Result:
-- region   total_sales  total_profit  profit_margin_pct
-- West     725457.82    108418.45     14.9
-- East     678781.24    91522.78      13.5
-- Central  501239.89    39706.36      7.9
-- South    391721.91    46749.43      11.9

-- Finding: West leads in both sales and margin (14.9%). Central is #3 in sales
-- but has the weakest margin (7.9%), so it is worth investigating (discounts? product mix?).

