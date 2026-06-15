-- =============================================================================
-- Script  : bronze_load.sql
-- Schema  : bronze
-- Purpose : Full refresh load of all bronze tables from source CSV files
--           Truncates each table before loading to prevent duplicate data
-- Usage   : psql -U dwh_owner -d datawarehouse -f bronze_load.sql
-- =============================================================================


-- -----------------------------------------------------------------------------
-- CRM Tables
-- -----------------------------------------------------------------------------

TRUNCATE TABLE bronze.crm_cust_info;
\copy bronze.crm_cust_info FROM '/home/kim/datawarehouse/data/cust_info.csv' WITH (FORMAT csv, HEADER true);

TRUNCATE TABLE bronze.crm_prd_info;
\copy bronze.crm_prd_info FROM '/home/kim/datawarehouse/data/prd_info.csv' WITH (FORMAT csv, HEADER true);

TRUNCATE TABLE bronze.crm_sales_details;
\copy bronze.crm_sales_details FROM '/home/kim/datawarehouse/data/sales_details.csv' WITH (FORMAT csv, HEADER true);


-- -----------------------------------------------------------------------------
-- ERP Tables
-- -----------------------------------------------------------------------------

TRUNCATE TABLE bronze.erp_cust_az12;
\copy bronze.erp_cust_az12 FROM '/home/kim/datawarehouse/data/CUST_AZ12.csv' WITH (FORMAT csv, HEADER true);

TRUNCATE TABLE bronze.erp_loc_a101;
\copy bronze.erp_loc_a101 FROM '/home/kim/datawarehouse/data/LOC_A101.csv' WITH (FORMAT csv, HEADER true);

TRUNCATE TABLE bronze.erp_px_cat_g1v2;
\copy bronze.erp_px_cat_g1v2 FROM '/home/kim/datawarehouse/data/PX_CAT_G1V2.csv' WITH (FORMAT csv, HEADER true);
