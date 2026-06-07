{{ config(
     materialized= 'table'
     )}}

     select trip_id, count(legs_count) as leg_count
     from {{ref('int_trips')}}
     group by trip_id