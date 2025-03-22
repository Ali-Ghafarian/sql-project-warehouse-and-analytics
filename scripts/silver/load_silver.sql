-- Load the silver layer. It uses the saved stored procedure (proc_load_silver.sql).

USE DataWarehouse;
GO

EXEC silver.load_silver;

-- Check the data in the bronze layer i.e crm_cust_info table
SELECT * FROM silver.crm_prd_info;