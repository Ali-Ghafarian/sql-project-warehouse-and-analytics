-- Load the bronze layer. It uses the saved stored procedure (proc_load_bronze.sql) to load the bronze layer.

USE DataWarehouse;
EXEC bronze.load_bronze;

-- Check the data in the bronze layer i.e crm_cust_info table
SELECT * FROM bronze.crm_cust_info;