-- models/staging/stg_orders.sql

WITH source_order_detail AS (
    SELECT *
    FROM {{ source('raw_pos', 'order_detail') }}  -- Assuming you have configured this source in your schema.yml
)

SELECT
  order_id,
  menu_item_id,
  discount_id,
  line_number,
  quantity,
  unit_price,
  price,
  order_item_discount_amount  
FROM source_order_detail