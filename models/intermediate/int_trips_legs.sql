{{ config(
     materialized= 'incremental', 
     incremental_strategy='merge',
     unique_key = ['trip_id', 'leg_id']

     )}}



with base as (

    select th.trip_id , th.trip_name , th.plannedDate , tl.leg_id , th.last_load, th.last_updated, tl.deleted_flag , tl.customer_id

    from {{ref('int_trips')}} th inner join {{ref('stg_trip_legs')}} tl
     on th.trip_id = tl.trip_id
)

select * from base where deleted_flag = 0 

{% if is_incremental() %}
   and  last_updated >= (select max(last_updated) from {{this}})

{% endif %}


