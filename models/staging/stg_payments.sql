select
  cast(payment_id as integer) as payment_id,
  cast(order_id as integer) as order_id,
  payment_method,
  cast(amount as double) as amount,
  status,
  cast(paid_at as timestamp) as paid_at
from {{ ref('payments') }}
