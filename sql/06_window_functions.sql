-- Question 1: Rank products by sales WITHIN each category (top 3 per category).

WITH ranked AS (
    SELECT
        category,
        product_name,
        ROUND(SUM(sales), 2) AS total_sales,
        RANK() OVER (PARTITION BY category ORDER BY SUM(sales) DESC) AS sales_rank
    FROM orders
    GROUP BY category, product_name
)
-- Filter in an outer query: WHERE runs before window functions, so sales_rank can't be filtered in the CTE itself.
SELECT *
FROM ranked
WHERE sales_rank <= 3
ORDER BY category, sales_rank;

-- Result:
-- category         product_name                                          total_sales  sales_rank
-- Furniture        HON 5400 Series Task Chairs for Big and Tall          21870.58     1
-- Furniture        Riverside Palais Royal Lawyers Bookcase               15610.97     2
-- Furniture        Bretford Rectangular Conference Table Tops            12995.29     3
-- Office Supplies  Fellowes PB500 Electric Punch Plastic Comb Binding    27453.38     1
-- Office Supplies  GBC DocuBind TL300 Electric Binding System            19823.48     2
-- Office Supplies  GBC Ibimaster 500 Manual ProClick Binding System      19024.50     3
-- Technology       Canon imageCLASS 2200 Advanced Copier                 61599.82     1
-- Technology       Cisco TelePresence System EX90 Videoconferencing Unit 22638.48     2
-- Technology       Hewlett Packard LaserJet 3310 Copier                  18839.69     3

-- Finding: The Canon copier ($61.6k) sells almost 3x more than any other product.
-- Office Supplies' top sellers are all binding machines.

-- Question 2: Show monthly sales with a running (cumulative) total.

WITH monthly AS (
    SELECT
        strftime('%Y-%m', order_date) AS month,
        SUM(sales) AS monthly_sales
    FROM orders
    GROUP BY month
)
SELECT
    month,
    ROUND(monthly_sales, 2) AS monthly_sales,
    ROUND(SUM(monthly_sales) OVER (ORDER BY month), 2) AS running_total
FROM monthly
ORDER BY month;

-- Result (first 3 and last row of 48):
-- month    monthly_sales  running_total
-- 2014-01  14236.90       14236.90
-- 2014-02  4519.89        18756.79      (= 14236.90 + 4519.89)
-- 2014-03  55691.01       74447.80      (= 18756.79 + 55691.01)
-- ...
-- 2017-12  83829.32       2297200.86

-- Finding: Total sales over the 4 years were about $2.30M.
