INSERT INTO silver.crm_cust_info(
    cst_id,
    cst_key,
    cst_firstname,
    cst_lastname,
    cst_material_status,
    cst_gndr,
    cst_create_date)

SELECT
cst_id,
cst_key,
TRIM(cst_firstname) AS cst_firstname,
TRIM(cst_lastname) AS cst_lastname,
CASE WHEN cst_material_status = 'S' THEN 'SINGLE'
     WHEN cst_material_status = 'M' THEN 'MARRIED'
     ELSE 'n/a'
END cst_material_status,
CASE WHEN cst_gndr = 'F' THEN 'FEMALE'
     WHEN cst_gndr = 'M' THEN 'MALE'
     ELSE 'n/a'
END cst_gndr,
cst_create_date
FROM(
SELECT 
*,
ROW_NUMBER() OVER (PARTITION BY  cst_id ORDER BY cst_create_date DESC) as flag_last
FROM bronze.crm_cust_info
)t WHERE flag_last = 1 
