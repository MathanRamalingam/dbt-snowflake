{{ config(
     materialized= 'incremental', 
     incremental_strategy='merge',
     unique_key = ['price_clarification_id']

     )}}

select 
price_clarification_id,
order_id,
orderType,
customer_id,
trip_id,
pickupDate,
status ,
payerPrice,
receiverPrice,
currency,
kilometer,
last_load,
last_updated

from {{ ref ('stg_price_clarification')}}
where deleted_flag = 0 and pickupDate is not null
  and ordertype in ('TRANSPORT', 'TRIP_LEG')

{% if is_incremental() %}

    and  last_updated >= (select max(last_updated) from {{this}})

{% endif %}