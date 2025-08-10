# Ecommerce Analytics — dbt + DuckDB (CI-ready)
[![dbt (DuckDB)](https://github.com/ladistar/ecomm-analytics-dbt/actions/workflows/dbt_duckdb.yml/badge.svg)](https://github.com/ladistar/ecomm-analytics-dbt/actions/workflows/dbt_duckdb.yml)
**▶ Live dbt docs:** https://ladistar.github.io/ecomm-analytics-dbt/

---
I built this as a hands-on, zero-credential demo of how I approach analytics engineering with dbt.  
You can clone it, hit **Run workflow**, and watch the project build, test, and publish docs—no cloud warehouse required.

## What it builds
- **Seeds → Staging → Intermediate → Marts**
- **Facts & dims:** `fct_orders`, `dim_customers`, `dim_products`
- **Metrics tables:** `daily_revenue`, `aov_by_day`
- **Tests:** keys, relationships, and data-quality checks with `dbt-utils` and `dbt-expectations`
- **Snapshots:** example SCD snapshot for customers
- **Docs:** `dbt docs generate` (optionally deployed to GitHub Pages)
- **Artifacts:** Action uploads the `target/` folder and `ecommerce.duckdb` file

## Quickstart (local)

Requirements:
- Python 3.11+
- `pip install dbt-duckdb`

Then:
```bash
pip install --upgrade pip
pip install dbt-duckdb

# from repo root
dbt deps
dbt seed --profiles-dir .
dbt run  --profiles-dir .
dbt test --profiles-dir .
dbt snapshot --profiles-dir .  # optional
dbt docs generate --profiles-dir .
```

Open docs locally:
```bash
python -m http.server -d target
# visit http://localhost:8000 and click "index.html"
```

## GitHub Actions (CI)

- The workflow lives at `.github/workflows/dbt_duckdb.yml`
- It runs: deps → seed → run → test → snapshot → docs
- Uploads artifacts: `target/` and `ecommerce.duckdb`
- Optionally deploys docs to GitHub Pages (enable Pages in Settings first)

## Project layout

```
seeds/               # CSV demo data
models/
  staging/           # typed, cleaned staging models
  intermediate/      # enriched aggregates/joins
  marts/             # dims, facts, and metrics
snapshots/           # SCD snapshot example
analyses/            # example queries for reviewers
macros/              # custom macros (light)
```

## Business context

You’re an ecommerce company selling consumer goods online. We track customers, products, orders, order items, payments, and basic web events. The marts expose core analytics like **revenue**, **AOV**, **units sold**, and **customer lifecycle** (first/last order, order count, LTV approximation).

## Notes

- Default profile uses DuckDB with a local file: `ecommerce.duckdb`
- No credentials are needed in CI
- If you prefer another warehouse later, swap the profile and keep the same models
