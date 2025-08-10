select
  p.category,
  sum(f.revenue) as revenue
from {{ ref('fct_orders') }} f
join {{ ref('dim_products') }} p on f.order_id in (
  select oi.order_id from {{ ref('stg_order_items') }} oi where oi.product_id = p.product_id
)
group by 1
order by 2 desc
