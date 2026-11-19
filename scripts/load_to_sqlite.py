"""Load the Superstore CSV into data/superstore.db (table: orders).

Run from the project folder: python scripts/load_to_sqlite.py
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
    if len(csv_files) != 1:
        sys.exit(f"Expected one CSV in {RAW_DIR}, found {len(csv_files)}.")
    return csv_files[0]


def main() -> None:
    csv_path = find_csv()
    df = pd.read_csv(csv_path, encoding="latin-1")

    # "Order Date" -> "order_date"
    df.columns = df.columns.str.strip().str.lower().str.replace(r"[^a-z0-9]+", "_", regex=True)

    # YYYY-MM-DD so strftime works in SQLite
    for col in ["order_date", "ship_date"]:
        df[col] = pd.to_datetime(df[col], format="%m/%d/%Y").dt.strftime("%Y-%m-%d")

    with sqlite3.connect(DB_PATH) as conn:
        df.to_sql("orders", conn, if_exists="replace", index=False)

    print(f"Loaded {len(df):,} rows into {DB_PATH.name}")


if __name__ == "__main__":
    main()
