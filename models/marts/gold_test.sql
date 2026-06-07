{{
    config
    (materialized = 'table')
}}


select orderType , sum(coalesce(payerPrice , receiverPrice) )as price , count(*) as count
from {{ref('int_price_clarification')}}
group by orderType