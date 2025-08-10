with orders as (
  select * from {{ ref('fct_orders') }}
),
agg as (
  select
    customer_id,
    min(order_date) as first_order_date,
    max(order_date) as last_order_date,
    count(*)        as orders_count,
    sum(revenue)    as total_revenue
  from orders
  group by 1
)
select
  c.customer_id,
  c.first_name,
  c.last_name,
  c.email,
  c.signup_date,
  c.state,
  a.first_order_date,
  a.last_order_date,
  a.orders_count,
  a.total_revenue
from {{ ref('stg_customers') }} c
left join agg a using (customer_id)
