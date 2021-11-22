
-- Use the `ref` function to select from other models

-- select *
-- from {{ ref('customer') }}
-- where customer_id >=5

--{{ config(materialized='table') }}

--FILM_INFO
with film as (
select film_id, title , length , rating , description , language_id, release_year , rental_rate , rental_duration , replacement_cost 
from public.film
),
film_category as (
select film_id , category_id
from public.film_category
),
category as (
select name, category_id
from public.category
)
select a.film_id, a.title , a.length , a.rating , a.description , a.language_id, 
case 
	when  a.language_id = 1 then 'English' 
	when  a.language_id = 2 then 'Italian' 
	when  a.language_id = 3 then 'Japanese' 
	when  a.language_id = 4 then 'Mandarin' 
	when  a.language_id = 5 then 'French' 
	when  a.language_id = 6 then 'German' 
end as language
, a.release_year , a.rental_rate , a.rental_duration , a.replacement_cost,
c.category_id , c."name"  as film_category
from film a
inner join film_category b on a.film_id = b.film_id
inner join category c on b.category_id  = c.category_id
