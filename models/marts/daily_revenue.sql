select
  order_date,
  count(*) as orders,
  sum(revenue) as revenue
from {{ ref('fct_orders') }}
group by 1
