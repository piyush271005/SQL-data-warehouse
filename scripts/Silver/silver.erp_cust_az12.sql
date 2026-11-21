TRUNCATE TABLE Silver.erp_cust_az12 
INSERT INTO Silver.erp_cust_az12(cid,bdate,gen)
SELECT 
CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid,4,LEN(cid))
     ELSE cid
END cid,
CASE WHEN bdate > GETDATE() THEN Null
    ELSE bdate
END AS bdate,
CASE WHEN SUBSTRING(gen,1,1) = 'M' THEN 'MALE'
     WHEN SUBSTRING(gen,1,1) = 'F' THEN 'FEMALE'
ELSE 'n/a'
END AS gen
FROM bronze.erp_cust_az12
SELECT *
FROM Silver.erp_cust_az12