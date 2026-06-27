# Retail Sales SQL Analysis

A beginner-to-intermediate SQL portfolio project analyzing a fictional retail sales dataset. This project demonstrates real-world SQL skills including joins, aggregations, subqueries, window functions, and CTEs.

## Project Structure

```
retail-sales-sql/
├── README.md
├── schema_and_data.sql      # Table creation + sample data inserts
├── queries.sql              # 15+ analysis queries with comments
└── sales_data.csv           # Raw data (importable into Excel or DB tools)
```

## Dataset Overview

The dataset simulates a small retail business with the following tables:

| Table        | Description                              |
|--------------|------------------------------------------|
| `customers`  | Customer info (id, name, region, etc.)   |
| `products`   | Product catalog (id, name, category, price) |
| `orders`     | Order header (id, customer, date, status)|
| `order_items`| Line items per order (product, qty, price)|

## Skills Demonstrated

- **SQL**: SELECT, WHERE, GROUP BY, HAVING, ORDER BY
- **Joins**: INNER, LEFT, self-joins
- **Aggregations**: SUM, COUNT, AVG, MIN, MAX
- **Subqueries & CTEs**: WITH clauses, derived tables
- **Window Functions**: ROW_NUMBER, RANK, LAG, running totals
- **Excel**: The CSV file can be opened in Excel for pivot table analysis

## How to Run

1. **SQLite (recommended for beginners)**
   ```bash
   sqlite3 retail.db < schema_and_data.sql
   sqlite3 retail.db < queries.sql
   ```

2. **PostgreSQL**
   ```bash
   psql -U youruser -d yourdb -f schema_and_data.sql
   psql -U youruser -d yourdb -f queries.sql
   ```

3. **MySQL** — Minor syntax adjustments may be needed for window functions on older versions.

4. **Online** — Paste into [sqliteonline.com](https://sqliteonline.com) or [db-fiddle.com](https://www.db-fiddle.com) with SQLite selected.

## Query Summary

| # | Query Description | Concepts Used |
|---|-------------------|---------------|
| 1 | All orders with customer names | INNER JOIN |
| 2 | Total revenue by category | GROUP BY, SUM |
| 3 | Top 5 customers by spend | ORDER BY, LIMIT |
| 4 | Orders with no items | LEFT JOIN, IS NULL |
| 5 | Average order value | AVG, subquery |
| 6 | Revenue by region | JOIN, GROUP BY |
| 7 | Month-over-month revenue | strftime, GROUP BY |
| 8 | Products never ordered | LEFT JOIN, IS NULL |
| 9 | Customer order counts | COUNT, GROUP BY |
| 10 | Orders above average value | Subquery, HAVING |
| 11 | Running total of revenue | Window: SUM OVER |
| 12 | Rank customers by spend | Window: RANK() |
| 13 | Month-over-month change | Window: LAG() |
| 14 | Top product per category | CTE + ROW_NUMBER |
| 15 | Customer lifetime value CTE | CTE, aggregation |
| 16 | % of total revenue per region | Window: SUM OVER partition |

## Excel Usage

Open `sales_data.csv` in Excel to:
- Create a Pivot Table summarizing revenue by category or region
- Build a bar chart of monthly sales
- Use VLOOKUP or SUMIF to cross-reference product data

## Author

Built as a portfolio project to demonstrate SQL data analysis skills.