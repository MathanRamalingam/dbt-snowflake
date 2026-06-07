
select 
VALUE:trip_id::STRING AS trip_id,
  VALUE:version::NUMBER AS version_no,
  VALUE:createdAt::TIMESTAMP_NTZ AS createdAt,
  VALUE:trip_reference::STRING AS trip_reference,
  VALUE:trip_name::STRING AS trip_name,
  VALUE:customer_id::NUMBER AS customer_id,
  VALUE:plannedDate::TIMESTAMP_NTZ AS plannedDate,
  VALUE:transportation_requestids::STRING AS transportation_requestids,
  VALUE:transportation_request_count::NUMBER AS transportation_request_count,
  VALUE:statuses::STRING AS statuses,
  VALUE:legs_count::NUMBER AS legs_count,
  VALUE:tags::STRING AS tags,
  VALUE:originRouteId::STRING AS originRouteId,
  VALUE:staticOriginRoute::BOOLEAN AS staticOriginRoute,
  VALUE:availableBeforeTripConfirmation::BOOLEAN AS availableBeforeTripConfirmation,
  VALUE:originalVariationId::STRING AS originalVariationId,
  VALUE:last_load::TIMESTAMP_NTZ AS last_load,
  VALUE:deleted_flag::BOOLEAN AS deleted_flag,
  VALUE:last_updated::TIMESTAMP_NTZ AS last_updated
from {{source ('snowf' , 'trips_header')}}
sample(100 rows)