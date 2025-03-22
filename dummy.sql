USE DataWarehouse;
GO

WITH transformed_erp AS (
    SELECT 
        CASE 
            WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
            ELSE cid 
        END AS transformed_cid
    FROM bronze.erp_cust_az12
)
SELECT DISTINCT 
    cst_key
FROM bronze.crm_cust_info
WHERE cst_key NOT IN (
    SELECT transformed_cid 
    FROM transformed_erp
);

with erp as (
SELECT 
    CASE 
        WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
        ELSE cid 
    END AS transformed_cid
FROM bronze.erp_cust_az12
)
SELECT *--cst_key
FROM (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS flag_last
    FROM bronze.crm_cust_info
) AS t
WHERE flag_last = 1 and cst_key NOT IN (
    SELECT transformed_cid 
    FROM erp
);