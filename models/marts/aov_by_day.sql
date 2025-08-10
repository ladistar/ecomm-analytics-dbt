select
  order_date,
  case when count(*) = 0 then null else sum(revenue) / count(*) end as aov
from {{ ref('fct_orders') }}
group by 1
