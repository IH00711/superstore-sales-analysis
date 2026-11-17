-- Question: Which regions generate the most sales and profit?

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) * 100.0 / SUM(sales), 1) AS profit_margin_pct
FROM orders
GROUP BY region
ORDER BY total_sales DESC;

-- Margin uses SUM(profit) / SUM(sales) rather than AVG(profit / sales), so large orders carry more weight.

-- Result:
-- region   total_sales  total_profit  profit_margin_pct
-- West     725457.82    108418.45     14.9
-- East     678781.24    91522.78      13.5
-- Central  501239.89    39706.36      7.9
-- South    391721.91    46749.43      11.9

-- Finding: West leads in both sales and margin (14.9%). Central is #3 in sales
-- but has the weakest margin (7.9%), so it is worth investigating (discounts? product mix?).

