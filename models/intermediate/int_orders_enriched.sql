with base as (
  select
    o.order_id,
    o.customer_id,
    o.order_date,
    o.status,
    o.promo_code
  from {{ ref('stg_orders') }} o
  where status in ('completed','refunded')  -- exclude cancelled from core facts
),
joined as (
  select
    b.*,
    i.items_count,
    i.item_revenue,
    p.paid_amount,
    p.successful_payments,
    p.first_paid_at
  from base b
  left join {{ ref('int_order_item_agg') }} i on b.order_id = i.order_id
  left join {{ ref('int_payment_agg') }}   p on b.order_id = p.order_id
)
select * from joined
