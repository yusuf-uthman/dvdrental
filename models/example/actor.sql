
-- Use the `ref` function to select from other models

-- select *
-- from {{ ref('customer') }}
-- where customer_id >=5

--{{ config(materialized='table') }}

with src_actors as (

select * from public.actor_info

)

select *
from src_actors