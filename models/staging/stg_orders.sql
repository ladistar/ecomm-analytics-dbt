select
  cast(order_id as integer) as order_id,
  cast(customer_id as integer) as customer_id,
  cast(order_date as date) as order_date,
  status,
  nullif(promo_code, '') as promo_code
from {{ ref('orders') }}
