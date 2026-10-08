"""Load the raw Superstore CSV into a SQLite database so you can query it with SQL.

Usage (from the project folder):
    python scripts/load_to_sqlite.py

Creates data/superstore.db with one table called `orders`.
"""

import sqlite3
import sys
from pathlib import Path

import pandas as pd

PROJECT_DIR = Path(__file__).resolve().parent.parent
RAW_DIR = PROJECT_DIR / "data" / "raw"
DB_PATH = PROJECT_DIR / "data" / "superstore.db"


def find_csv() -> Path:
    csv_files = list(RAW_DIR.glob("*.csv"))
    if not csv_files:
        sys.exit(f"No CSV found in {RAW_DIR}. Download it from Kaggle and put it there first.")
    if len(csv_files) > 1:
        sys.exit(f"Found more than one CSV in {RAW_DIR}: {[f.name for f in csv_files]}. Keep only one.")
    return csv_files[0]


def main() -> None:
    csv_path = find_csv()

    # The file is not UTF-8, so we tell pandas which encoding to use.
    df = pd.read_csv(csv_path, encoding="latin-1")

    # "Sub-Category" -> "sub_category", "Order Date" -> "order_date", etc.
    # Snake_case names are much easier to type in SQL (no quotes needed).
    df.columns = df.columns.str.strip().str.lower().str.replace(r"[^a-z0-9]+", "_", regex=True)

    # Store dates as YYYY-MM-DD text so SQLite's date functions (strftime, julianday) work.
    for col in ["order_date", "ship_date"]:
        df[col] = pd.to_datetime(df[col], format="%m/%d/%Y").dt.strftime("%Y-%m-%d")

    with sqlite3.connect(DB_PATH) as conn:
        df.to_sql("orders", conn, if_exists="replace", index=False)

    print(f"Loaded {len(df):,} rows from {csv_path.name} into {DB_PATH.relative_to(PROJECT_DIR)} (table: orders)")
    print("Columns:", ", ".join(df.columns))


if __name__ == "__main__":
    main()
