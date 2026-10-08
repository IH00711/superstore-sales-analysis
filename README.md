# Superstore Sales & Customer Insights Analysis

Analysis of ~10,000 orders from a US office-supply retailer (2014–2017) to find sales trends, identify high-value customers, and make business recommendations.

**Tools:** SQL (SQLite) · Python (pandas, matplotlib, seaborn) · Excel · Tableau Public

> 🚧 Work in progress. See [PLAN.md](PLAN.md) for the roadmap.

## Business Questions

1. Which regions, categories, and products drive sales and profit?
2. How have sales changed over time? Is there seasonality?
3. Who are the most valuable customers, and how should they be segmented?
4. What should the business do differently?

## Key Findings

_To be filled in after the analysis._

## Recommendations

_To be filled in after the analysis._

## Project Structure

```
├── data/
│   ├── raw/            # Original Kaggle CSV
│   └── processed/      # Cleaned data from the notebooks
├── sql/                # SQL queries (Week 1)
├── scripts/            # Helper scripts (e.g. load CSV into SQLite)
├── notebooks/          # Jupyter notebooks: cleaning, KPIs, RFM (Weeks 2–3)
├── excel/              # Excel summary workbook (Week 4)
├── dashboard/          # Dashboard file + screenshots (Week 4)
└── reports/            # Executive summary and saved charts
```

## How to Run

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python scripts/load_to_sqlite.py      # builds data/superstore.db
```

Then open the notebooks in `notebooks/` with VS Code or Jupyter.

## Data Source

[Superstore Dataset (Kaggle)](https://www.kaggle.com/datasets/vivek468/superstore-dataset-final)
