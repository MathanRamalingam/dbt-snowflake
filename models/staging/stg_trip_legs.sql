select 
VALUE:trip_id::STRING AS trip_id,
  VALUE:customer_id::NUMBER AS customer_id,
  VALUE:trip_reference::STRING AS trip_reference,
  VALUE:leg_id::STRING AS leg_id,
    VALUE:last_load::TIMESTAMP_NTZ AS last_load,
  VALUE:deleted_flag::BOOLEAN AS deleted_flag,
  VALUE:stops_count::NUMBER AS stops_count,
  VALUE:last_updated::TIMESTAMP_NTZ AS last_updated
from {{source ('snowf' , 'trips_legs')}}
sample(100 rows)