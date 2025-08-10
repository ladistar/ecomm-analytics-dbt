select
  cast(event_id as integer) as event_id,
  cast(customer_id as integer) as customer_id,
  event_type,
  cast(event_ts as timestamp) as event_ts,
  page
from {{ ref('web_events') }}
