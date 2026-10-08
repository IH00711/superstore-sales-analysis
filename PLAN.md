# Project 1 Plan: Sales & Customer Insights Analysis

**Timeline:** Oct 16 → Nov 16, 2026 · ~2–3 hrs/week

Tick boxes by changing `[ ]` to `[x]`. Commit after each step.

---

## Step 0 · Setup (before Oct 16)

- [x] GitHub repo created
- [x] Folder structure, Python environment, VS Code extensions
- [ ] Download `Sample - Superstore.csv` from [Kaggle](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final) → put it in `data/raw/`
- [ ] Run `python scripts/load_to_sqlite.py` → creates `data/superstore.db`
- [ ] First commit + push

## Week 1 · Understand the data + SQL

- [ ] Write a one-line description of every column (add it to `sql/00_data_dictionary.md`)
- [ ] `sql/01_sales_by_region.sql` — sales & profit by region
- [ ] `sql/02_sales_by_category.sql` — sales & profit by category / sub-category
- [ ] `sql/03_sales_over_time.sql` — sales by year and month
- [ ] `sql/04_top_products.sql` — top 10 products by sales vs. by profit
- [ ] `sql/05_loss_making_products.sql` — products losing money
- [ ] `sql/06_window_functions.sql` — rank products within category, running totals
- **Deliverable:** SQL queries

## Week 2 · Clean the data + calculate KPIs (Python)

Notebook: `notebooks/01_cleaning_and_kpis.ipynb`

- [ ] Load the CSV (hint: `encoding="latin-1"`)
- [ ] Check shape, dtypes, missing values, duplicates
- [ ] Convert dates; add year, month, ship days, profit margin
- [ ] KPIs: total sales, total profit, profit margin, # orders, average order value, top products
  - ⚠️ One order can have many rows → AOV = total sales ÷ **unique** Order IDs
- [ ] Charts: monthly sales trend, sales by category/region
- [ ] Save `data/processed/superstore_clean.csv`
- **Deliverable:** cleaned dataset, KPIs

## Week 3 · Customer segmentation (RFM)

Notebook: `notebooks/02_rfm_segmentation.ipynb`

- [ ] For each customer: Recency (days since last order), Frequency (unique orders), Monetary (total sales)
- [ ] Score each 1–5 and combine into segments (Champions, Loyal, At Risk, Lost, …)
- [ ] Identify the top 10% of customers — what share of sales/profit do they bring in?
- [ ] Save `data/processed/customer_segments.csv`
- **Deliverable:** customer segments

## Week 4 · Excel, dashboard, executive summary

- [ ] `excel/superstore_summary.xlsx` — KPI sheet + pivot tables (e.g. region × category)
- [ ] Dashboard in Tableau Public (Power BI Desktop doesn't run on Mac) → save screenshots in `dashboard/`
- [ ] `reports/executive_summary.md` — 1 page, 3 recommendations
- [ ] Fill in the README: key findings, recommendations, dashboard screenshot
- [ ] Make the repo public when you're proud of it
- **Deliverable:** dashboard + summary
