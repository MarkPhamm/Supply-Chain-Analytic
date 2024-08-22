-- CREATE DATABASE SUPPLY_CHAIN_ANALYTICS;

USE SUPPLY_CHAIN_ANALYTICS;
-- CREATE SCHEMA original;

-- CREATE TABLE SUPPLY_CHAIN_ANALYTICS.original.fulfillment (
--     product_name VARCHAR(MAX),
--     warehouse_order_fulfillment_days FLOAT
-- );

WITH cte_fulfillment AS (
    SELECT * 
    FROM SUPPLY_CHAIN_ANALYTICS.original.fulfillment
    -- ORDER BY 1
),

cte_product AS (
    SELECT DISTINCT 
        product_name, 
        product_category,
        product_department
    FROM SUPPLY_CHAIN_ANALYTICS.original.orders
)
SELECT 
    cte_fulfillment.product_name,
    CASE WHEN product_category IS NULL THEN 'Unknown' ELSE product_category END AS product_category,
    CASE WHEN product_department IS NULL THEN 'Unknown' ELSE product_department END AS product_department,
    warehouse_order_fulfillment_days
FROM cte_fulfillment
LEFT JOIN cte_product
ON cte_fulfillment.product_name = cte_product.product_name;

SELECT distinct
    customer_country, 
    customer_market,
    customer_region
FROM SUPPLY_CHAIN_ANALYTICS.original.orders
;

SELECT distinct 
    shipment_mode, 
    shipment_days_scheduled
FROM SUPPLY_CHAIN_ANALYTICS.original.orders
ORDER BY 2;

SELECT 
    order_id,
    CAST(
        CONCAT(order_year, '-', order_month, '-', order_day) AS DATE
    ) AS order_date,
    order_time,
    order_quantity,
    product_name, 
    customer_country,
    CAST(
        CONCAT(shipment_year, '-', shipment_month, '-', shipment_day) AS DATE
    ) AS shipment_date,
    shipment_mode,
    gross_sales,
    discount_percent,
    profit
FROM 
    SUPPLY_CHAIN_ANALYTICS.original.orders;

-- ORDER BY order_date

