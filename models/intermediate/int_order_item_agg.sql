with items as (
  select
    oi.order_id,
    sum(oi.quantity) as items_count,
    sum(oi.quantity * oi.unit_price) as item_revenue
  from {{ ref('stg_order_items') }} oi
  group by 1
)
select * from items
