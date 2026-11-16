-- Question: What are the top 10 products by sales? And the top 10 by profit? Are they the same?
-- Concepts: GROUP BY, ORDER BY ... DESC, LIMIT

-- Query A (top 10 by sales):

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,      -- CHANGED: added ROUND (was: SUM(sales) AS total_sales)
    ROUND(SUM(profit), 2) AS total_profit     -- CHANGED: added this line so sales and profit can be compared (was: not there)
FROM
    orders                                    -- CHANGED: was superstore_sales (that table doesn't exist)
GROUP BY
    product_name
ORDER BY
    total_sales DESC
LIMIT 10;

-- Query B (top 10 by profit):

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,      -- CHANGED: added this line so sales and profit can be compared (was: not there)
    ROUND(SUM(profit), 2) AS total_profit     -- CHANGED: was SUM(sales) AS total_profit (it added up sales, not profit)
FROM
    orders                                    -- CHANGED: was superstore_profit (that table doesn't exist)
GROUP BY
    product_name
ORDER BY
    total_profit DESC
LIMIT 10;

-- Result A (top 10 by sales):
-- product_name                                              total_sales  total_profit
-- Canon imageCLASS 2200 Advanced Copier                     61599.82     25199.93
-- Fellowes PB500 Electric Punch Plastic Comb Binding        27453.38     7753.04
-- Cisco TelePresence System EX90 Videoconferencing Unit     22638.48     -1811.08
-- HON 5400 Series Task Chairs for Big and Tall              21870.58     0.00
-- GBC DocuBind TL300 Electric Binding System                19823.48     2233.51
-- GBC Ibimaster 500 Manual ProClick Binding System          19024.50     760.98
-- Hewlett Packard LaserJet 3310 Copier                      18839.69     6983.88
-- HP Designjet T520 Inkjet Large Format Printer - 24" Color 18374.90     4094.98
-- GBC DocuBind P400 Electric Binding System                 17965.07     -1878.17
-- High Speed Automatic Electric Letter Opener               17030.31     -262.00

-- Result B (top 10 by profit):
-- product_name                                              total_sales  total_profit
-- Canon imageCLASS 2200 Advanced Copier                     61599.82     25199.93
-- Fellowes PB500 Electric Punch Plastic Comb Binding        27453.38     7753.04
-- Hewlett Packard LaserJet 3310 Copier                      18839.69     6983.88
-- Canon PC1060 Personal Laser Copier                        11619.83     4570.93
-- HP Designjet T520 Inkjet Large Format Printer - 24" Color 18374.90     4094.98
-- Ativa V4110MDD Micro-Cut Shredder                         7699.89      3772.95
-- 3D Systems Cube Printer, 2nd Generation, Magenta          14299.89     3717.97
-- Plantronics Savi W720 Multi-Device Wireless Headset       9367.29      3696.28
-- Ibico EPK-21 Electric Binding System                      15875.92     3345.28
-- Zebra ZM400 Thermal Label Printer                         6965.70      3343.54

-- Finding: The lists are NOT the same. Only 4 products are in both top 10s.
-- 3 of the top 10 best sellers actually lose money (Cisco TelePresence, GBC DocuBind P400,
-- Letter Opener), and the HON chair breaks even. High sales do not mean high profit.
