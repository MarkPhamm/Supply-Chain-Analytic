USE SUPPLY_CHAIN_ANALYTICS

ALTER TABLE dbo.fact_orders
ALTER COLUMN order_date DATE;

ALTER TABLE dbo.fact_orders
ALTER COLUMN shipment_date DATE;

SELECT * FROM dbo.fact_orders;
