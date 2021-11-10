
-- Use the `ref` function to select from other models

-- select *
-- from {{ ref('customer') }}
-- where customer_id >=5

--{{ config(materialized='table') }}

with src_film as (

select * from public.film

)

select *
from src_film