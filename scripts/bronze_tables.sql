-- =============================================================================
-- Script  : bronze_tables.sql
-- Schema  : bronze
-- Purpose : Create all source tables in the bronze layer of the data warehouse
-- Note    : Each table is dropped if it already exists before re-creation
-- =============================================================================


-- -----------------------------------------------------------------------------
-- CRM Tables
-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS bronze.crm_cust_info;
CREATE TABLE bronze.crm_cust_info (
    cst_id              INTEGER,
    cst_key             VARCHAR(50),
    cst_firstname       VARCHAR(50),
    cst_lastname        VARCHAR(50),
    cst_marital_status  VARCHAR(10),
    cst_gndr            VARCHAR(10),
    cst_create_date     DATE
);

DROP TABLE IF EXISTS bronze.crm_prd_info;
CREATE TABLE bronze.crm_prd_info (
    prd_id        INTEGER,
    prd_key       VARCHAR(50),
    prd_nm        VARCHAR(100),
    prd_cost      INTEGER,
    prd_line      VARCHAR(10),
    prd_start_dt  DATE,
    prd_end_dt    DATE
);

DROP TABLE IF EXISTS bronze.crm_sales_details;
CREATE TABLE bronze.crm_sales_details (
    sls_ord_num    VARCHAR(50),
    sls_prd_key    VARCHAR(50),
    sls_cust_id    INTEGER,
    sls_order_dt   INTEGER,
    sls_ship_dt    INTEGER,
    sls_due_dt     INTEGER,
    sls_sales      INTEGER,
    sls_quantity   INTEGER,
    sls_price      INTEGER
);


-- -----------------------------------------------------------------------------
-- ERP Tables
-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS bronze.erp_cust_az12;
CREATE TABLE bronze.erp_cust_az12 (
    cid   VARCHAR(20),
    bdate DATE,
    gen   VARCHAR(10)
);

DROP TABLE IF EXISTS bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101 (
    cid   VARCHAR(20),
    cntry VARCHAR(50)
);

DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2 (
    id          VARCHAR(10),
    cat         VARCHAR(50),
    subcat      VARCHAR(100),
    maintenance VARCHAR(10)
);
