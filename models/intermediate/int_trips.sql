{{ config(
     materialized= 'incremental', 
     incremental_strategy='merge',
     unique_key = ['trip_id']

     )}}

     select 
     trip_id,
    trip_name,
    version_no,
    createdAt,
    customer_id,
    plannedDate,
    statuses,
    legs_count,
    last_load,
    last_updated,

     from {{ref('stg_trips_header')}}
     where deleted_flag = 0 

{% if is_incremental() %}

    and  last_updated >= (select max(last_updated) from {{this}})

{% endif %}
