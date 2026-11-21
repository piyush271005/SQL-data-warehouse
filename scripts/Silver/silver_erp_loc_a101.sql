INSERT INTO silver.erp_loc_a101(cid,cntry)

SELECT 
REPLACE(cid,'-','') AS cid,
CASE WHEN SUBSTRING(cntry,1,1) = 'A' THEN 'Australia'
     WHEN SUBSTRING(cntry,1,2) = 'US' THEN 'United States'
     WHEN SUBSTRING(cntry,1,3) = 'USA' THEN 'United States'
     WHEN SUBSTRING(cntry,1,13) = 'United States' THEN 'United States'
     WHEN SUBSTRING(cntry,1,14) = 'United Kingdom' THEN 'United Kingdom'
     WHEN SUBSTRING(cntry,1,1) = 'C' THEN 'Canada'
     WHEN SUBSTRING(cntry,1,2) = 'DE' THEN 'Germany'
     WHEN SUBSTRING(cntry,1,1) = 'G' THEN 'Germany'
     WHEN SUBSTRING(cntry,1,1) = 'F' THEN 'France'
     ELSE 'n/a'
END AS country
FROM bronze.erp_loc_a101


