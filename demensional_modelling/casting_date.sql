USE SUPPLY_CHAIN_ANALYTICS

SELECT * FROM dbo.fact_orders

ALTER TABLE dbo.fact_orders
ALTER COLUMN order_date DATE;
