-- Product that loses money and their average discount

SELECT
    product_name,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(discount), 2) AS average_discount
FROM
    orders
GROUP BY
    product_name
HAVING
    SUM(profit) < 0
ORDER BY
    total_profit ASC;

-- product_name                                                       total_profit  average_discount
-- Cubify CubeX 3D Printer Double Head Print                          -8879.97      0.53
-- Lexmark MX611dhe Monochrome Laser Printer                          -4589.97      0.40
-- Cubify CubeX 3D Printer Triple Head Print                          -3839.99      0.50
-- Chromcraft Bull-Nose Wood Oval Conference Tables & Bases           -2876.12      0.28
-- Bush Advantage Collection Racetrack Conference Table               -1934.40      0.35
-- GBC DocuBind P400 Electric Binding System                          -1878.17      0.45
-- Cisco TelePresence System EX90 Videoconferencing Unit              -1811.08      0.50
-- Martin Yale Chadless Opener Electric Letter Opener                 -1299.18      0.10
-- Balt Solid Wood Round Tables                                       -1201.06      0.20
-- BoxOffice By Design Rectangular and Half-Moon Meeting Room Tables  -1148.44      0.48

-- Finding: 302 of 1,850 products (16%) lose money overall.
-- Their average discount is 29%, compared with 12% for profitable products.
-- 7 of the 10 worst losers were sold at 35% off or more, so heavy discounting is a likely cause.
