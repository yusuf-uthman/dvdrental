
-- Use the `ref` function to select from other models

select *
from {{ ref('customer') }}
where customer_id >=5
