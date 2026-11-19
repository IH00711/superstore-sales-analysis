# Data Dictionary

Table `orders` in `data/superstore.db`. One row per product in an order (9,994 rows, 5,009 orders).

| Column | Type | Description |
|---|---|---|
| row_id | integer | Row number, 1 to 9,994 |
| order_id | text | Order ID. One order can have several rows (one per product) |
| order_date | date | Date the order was placed (2014-01-03 to 2017-12-30) |
| ship_date | date | Date the order was shipped |
| ship_mode | text | Standard Class, Second Class, First Class or Same Day |
| customer_id | text | Customer ID (793 customers) |
| customer_name | text | Customer name |
| segment | text | Consumer, Corporate or Home Office |
| country | text | Always United States |
| city | text | City (531 in total) |
| state | text | State (49 in total) |
| postal_code | integer | ZIP code |
| region | text | West, East, Central or South |
| product_id | text | Product ID |
| category | text | Furniture, Office Supplies or Technology |
| sub_category | text | One of 17 sub-categories, e.g. Chairs, Phones, Binders |
| product_name | text | Product name (1,850 unique) |
| sales | number | Sale amount for the row in dollars, after discount |
| quantity | integer | Units sold (1 to 14) |
| discount | number | Discount as a decimal, 0 to 0.8 (0.2 = 20% off) |
| profit | number | Profit for the row in dollars. Negative means a loss |
