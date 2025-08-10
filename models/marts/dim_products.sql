with items as (
  select
    oi.product_id,
    sum(oi.quantity) as units_sold,
    sum(oi.quantity * oi.unit_price) as product_revenue
  from {{ ref('stg_order_items') }} oi
  join {{ ref('stg_orders') }} o on oi.order_id = o.order_id
  where o.status in ('completed','refunded')
  group by 1
)
select
  p.product_id,
  p.name,
  p.category,
  p.price,
  i.units_sold,
  i.product_revenue
from {{ ref('stg_products') }} p
left join items i using (product_id)
