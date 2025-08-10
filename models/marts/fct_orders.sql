select
  o.order_id,
  o.customer_id,
  o.order_date,
  o.status,
  coalesce(o.item_revenue, 0) as revenue,
  coalesce(o.items_count, 0) as items_count,
  coalesce(o.paid_amount, 0) as paid_amount,
  (coalesce(o.paid_amount,0) >= coalesce(o.item_revenue,0)) as is_fully_paid,
  o.promo_code
from {{ ref('int_orders_enriched') }} o
