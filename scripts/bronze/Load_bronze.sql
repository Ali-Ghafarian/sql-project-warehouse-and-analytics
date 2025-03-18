USE DataWarehouse;
EXEC bronze.load_bronze;

SELECT * FROM bronze.crm_cust_info;