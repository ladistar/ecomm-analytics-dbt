select
  cast(product_id as integer) as product_id,
  name,
  category,
  cast(price as double) as price
from {{ ref('products') }}
