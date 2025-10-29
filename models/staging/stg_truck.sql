
WITH source_truck AS (
    SELECT *
    FROM {{ source('raw_pos', 'truck') }}  -- Assuming you have configured this source in your schema.yml
)

select 
    truck_id,
    menu_type_id,
    primary_city,
    region,
    iso_region,
    country,
    iso_country_code,
    franchise_flag,
    year,
    make,
    model,
    ev_flag,    
    franchise_id,
    truck_opening_date   
from source_truck
LIMIT 100
