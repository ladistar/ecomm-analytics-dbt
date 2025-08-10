-- Example analysis: top 5 customers by revenue
select
  c.customer_id,
  c.first_name || ' ' || c.last_name as customer_name,
  c.total_revenue
from {{ ref('dim_customers') }} c
order by c.total_revenue desc nulls last
limit 5
