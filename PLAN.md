# Project plan

Started mid-October 2026. About 2-3 hours a week.

## Setup
- [x] Create the repo and folders, and set up the Python environment
- [x] Download the Superstore CSV from Kaggle into data/raw/
- [x] Load it into SQLite (scripts/load_to_sqlite.py)

## Week 1: SQL
- [x] Data dictionary (sql/00_data_dictionary.md)
- [x] 01 sales by region
- [x] 02 sales by category and sub-category
- [x] 03 sales by year and month
- [x] 04 top products by sales vs. by profit
- [x] 05 products that lose money
- [x] 06 window functions (rank within category, running total)

## Week 2: Cleaning and KPIs (notebook 01)
- [x] Load the CSV and check shape, types, missing values and duplicates
- [x] Convert the dates, and add year, month, ship days and profit margin
- [x] KPIs: sales, profit, margin, orders, AOV (AOV = sales / unique order IDs, since one order can have several rows)
- [x] Charts
- [x] Save the cleaned CSV

## Week 3: RFM segmentation (notebook 02)
- [x] Recency, frequency and monetary value for each customer
- [x] Score each 1-5 and name the segments
- [x] Find what share of sales and profit the top 10% of customers bring in
- [x] Save customer_segments.csv

## Week 4: Wrap-up
- [x] Executive summary
- [x] README
- [ ] Excel summary with pivot tables (maybe)
- [ ] Tableau Public dashboard (maybe)
- [ ] Make the repo public
