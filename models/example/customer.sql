
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

--{{ config(materialized='table') }}

with customer  as (
select  customer_id, active ,address_id ,store_id, first_name ,last_name, email ,create_date , last_update
from public.customer
),
address as (
select address_id , address, address2 , phone , city_id, district, postal_code, last_update
from public.address
),
city as (
select city_id, city, country_id
from public.city
),
country as (
select country_id, country
from public.country
),
store as (
select * from public.store
)
select 
distinct
cu.customer_id ,cu.active, case when cu.active = 1 then 'Active' else 'InActive' end as customer_status, cu.store_id , cu.first_name || '  ' || cu.last_name as customer_name, cu.email , date(cu.create_date)create_date,
ad.address_id , ad.address, ad.address2 , ad.phone , ad.city_id, ad.district, ad.postal_code, ci.city, ci.country_id, co.country
from customer cu
inner join address ad on cu.address_id  = ad.address_id 
inner join city ci  on ad.city_id = ci.city_id 
inner join country co on ci.country_id  = co.country_id 
