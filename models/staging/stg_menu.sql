
WITH source_menu AS (
    SELECT *
    FROM {{ source('raw_pos', 'menu') }}  -- Assuming you have configured this source in your schema.yml
)

SELECT
    menu_id,
    menu_type_id,
    menu_type,
    truck_brand_name,
    menu_item_id,
    menu_item_name,
    item_category,
    item_subcategory,
    unit_price_usd,
    cost_of_goods_usd,
    menu_description                                        
FROM source_menu
