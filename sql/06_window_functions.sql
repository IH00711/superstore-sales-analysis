-- Question 1: Rank products by sales WITHIN each category (top 3 per category).
-- Concepts: RANK() OVER (PARTITION BY ... ORDER BY ...), subquery or CTE (WITH ...)

-- Your query here:

-- Step 1 (the CTE): a temporary table called "ranked" that exists only while this query runs.
-- It holds every product, its total sales, and its rank inside its own category.
WITH ranked AS (
    SELECT
        category,
        product_name,
        ROUND(SUM(sales), 2) AS total_sales,
        -- RANK() numbers the rows 1, 2, 3, ...
        -- PARTITION BY category -> restart the numbering at 1 for each category
        -- ORDER BY SUM(sales) DESC -> the biggest seller in each category gets rank 1
        RANK() OVER (PARTITION BY category ORDER BY SUM(sales) DESC) AS sales_rank
    FROM orders
    GROUP BY category, product_name
)
-- Step 2: keep only the top 3 of each category.
-- We need the CTE because WHERE runs before window functions, so you can't write
-- "WHERE sales_rank <= 3" in the same query that creates sales_rank.
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
-- Concepts: SUM(...) OVER (ORDER BY ...)

-- Your query here:

-- Step 1: total sales per month. '%Y-%m' gives "2014-01", so year and month stay in one column.
WITH monthly AS (
    SELECT
        strftime('%Y-%m', order_date) AS month,
        SUM(sales) AS monthly_sales
    FROM orders
    GROUP BY month
)
-- Step 2: the running total.
-- SUM(...) OVER (ORDER BY month) adds up this month and every month before it.
-- Unlike GROUP BY, a window function keeps every row: 48 months in, 48 rows out.
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
