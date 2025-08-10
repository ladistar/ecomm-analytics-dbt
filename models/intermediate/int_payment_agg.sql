with payments as (
  select
    order_id,
    sum(case when status = 'paid' then amount else 0 end) as paid_amount,
    count_if(status = 'paid') as successful_payments,
    min(case when status = 'paid' then paid_at end) as first_paid_at
  from {{ ref('stg_payments') }}
  group by 1
)
select * from payments
