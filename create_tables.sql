
---> set the Role
USE ROLE ACCOUNTADMIN;

---> set the Warehouse
USE WAREHOUSE SNOWFLAKE_LEARNING_WH;

---> set the Database
USE DATABASE SNOWFLAKE_LEARNING_DB;

---> set the Schema
--SET schema_name = CONCAT('WF', '_INTRO_TO_DATA_ENGINEERING');
--USE SCHEMA IDENTIFIER($schema_name);
Use schema dbt_staging;


-- create the Truck table
CREATE OR REPLACE TABLE truck
(
    truck_id NUMBER(38,0),
    menu_type_id NUMBER(38,0),
    primary_city VARCHAR(16777216),
    region VARCHAR(16777216),
    iso_region VARCHAR(16777216),
    country VARCHAR(16777216),
    iso_country_code VARCHAR(16777216),
    franchise_flag NUMBER(38,0),
    year NUMBER(38,0),
    make VARCHAR(16777216),
    model VARCHAR(16777216),
    ev_flag NUMBER(38,0),
    franchise_id NUMBER(38,0),
    truck_opening_date DATE
);

-- Create the Menu table
CREATE OR REPLACE TABLE menu
(
    menu_id INT,    
    menu_type_id INT,
    menu_type VARCHAR(16777216),
    truck_brand_name VARCHAR(16777216),
    menu_item_id INT,
    menu_item_name VARCHAR(16777216),
    item_category VARCHAR(16777216),
    item_subcategory VARCHAR(16777216),
    unit_price_usd FLOAT,
    cost_of_goods_usd FLOAT,
    menu_description VARCHAR(16777216)
);


-- Create orders table
CREATE OR REPLACE TABLE order_detail
(
    order_detail_id NUMBER(38,0),
    order_id NUMBER(38,0),
    menu_item_id NUMBER(38,0),
    discount_id VARCHAR(16777216),
    line_number NUMBER(38,0),
    quantity NUMBER(5,0),
    unit_price NUMBER(38,4),
    price NUMBER(38,4),
    order_item_discount_amount VARCHAR(16777216)
);


---> create a stage to load data from S3

CREATE OR REPLACE STAGE blob_stage
url = 's3://sfquickstarts/tastybytes/'
file_format = (type = csv);


-- List files (optional)
--LIST @blob_stage;

---> copy the Truck file into the Truck table
COPY INTO truck
FROM @blob_stage/raw_pos/truck/;

/*
SELECT
  t.$1, t.$2, t.$3, t.$4, t.$5, t.$6, t.$7, t.$8, t.$9, t.$10,
  t.$11, t.$12, t.$13, t.$14, t.$15, t.$16, t.$17, t.$18, t.$19, t.$20, t.$21
FROM @blob_stage/raw_pos/order_detail/  t
LIMIT 5;
*/

---> copy the Menu file into the Menu table
COPY INTO menu  
FROM @blob_stage/raw_pos/menu/;

---> copy the Orders file into the Orders table
COPY INTO order_detail
FROM @blob_stage/raw_pos/order_detail/;