{{ config(
     materialized= 'incremental', 
     incremental_strategy='merge',
     unique_key = ['transportation_request_id']

     )}}

select 
    transportation_request_id,
    earliestPickupDateTime,
    latestPickupDateTime,
    earliestDeliveryDateTime,
    latestDeliveryDateTime,
    status,
    priority,
    serviceCode,
    plannedEarliestDeliveryDateTime,
    plannedEarliestPickupDateTime,
    plannedLatestDeliveryDateTime,
    plannedLatestPickupDateTime,
    last_load,
    last_updated,

from {{ref('stg_transportation_header')}}
where deleted_flag = 0 
  and earliestPickupDateTime is not null

{% if is_incremental() %}

    and  last_updated >= (select max(last_updated) from {{this}})

{% endif %}