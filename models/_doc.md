{% docs fct_orders %}
**Order-level fact table.**  
One row per order (completed or refunded).  
**Revenue** = sum of line `quantity * unit_price` for that order (from staged items).  
Also includes: `items_count`, `paid_amount`, `is_fully_paid`, and any `promo_code`.

**Use for:** order counts, revenue, AOV, paid vs. refunded analysis.
{% enddocs %}

{% docs dim_customers %}
**Customer dimension with lifecycle metrics.**  
Includes first/last order dates, total orders, and total revenue joined to core attributes (name, email, signup_date, state).

**Use for:** cohorting, retention, LTV approximations, segmentation.
{% enddocs %}

{% docs dim_products %}
**Product dimension with sales stats.**  
Base product attributes plus `units_sold` and `product_revenue` aggregated from order items.

**Use for:** category performance, price bands, attach rates.
{% enddocs %}

{% docs daily_revenue %}
**Daily rollup of orders and revenue** from `fct_orders`.  
One row per `order_date`.
{% enddocs %}

{% docs aov_by_day %}
**Average Order Value (AOV) by day**, computed as `sum(revenue)/count(orders)` from `fct_orders`.
{% enddocs %}
