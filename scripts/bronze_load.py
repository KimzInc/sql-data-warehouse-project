"""
===============================================================================
Script  : bronze_load.py
Purpose : Full refresh load of all bronze tables from source CSV files.
          Truncates each table before loading to prevent duplicate data.
Usage   : python3 bronze_load.py
Requires: pip install psycopg2-binary

save the script and run it to load the bronze layer tables. 
Make sure the database connection details and file paths are correct before execution.
dbname, user, password, and host should be updated to match your PostgreSQL configuration.
===============================================================================
"""

import psycopg2
import time


# =============================================================================
# Configuration
# =============================================================================

DB_CONFIG = {
    "host": "localhost",
    "port": 5432,
    "dbname":   "datawarehouse",
    "user":     "dwh_owner",
    "password": "your_database_password_here"
}

# Directory where source CSV files are located
DATA_DIR = "/home/kim/datawarehouse/data"

# Each enrty is (table_name, csv_file)

TABLES = [
    # CRM TABLES
    ("bronze.crm_cust_info",     "cust_info.csv"),
    ("bronze.crm_prd_info",      "prd_info.csv"),
    ("bronze.crm_sales_details", "sales_details.csv"),
    # ERP Tables
    ("bronze.erp_cust_az12",     "CUST_AZ12.csv"),
    ("bronze.erp_loc_a101",      "LOC_A101.csv"),
    ("bronze.erp_px_cat_g1v2",   "PX_CAT_G1V2.csv"),
]

# =============================================================================
# Load Function
# =============================================================================


def load_bronze():
    print("==================================================")
    print("Loading Bronze Layer")
    print("==================================================")

    batch_start = time.time()

    try:
        conn = psycopg2.connect(**DB_CONFIG)
        conn.autocommit = True
        cursor = conn.cursor()

        current_group = None

        for table, csv_file in TABLES:
            # Print group header (CRM/ERP)
            group = "CRM" if "crm" in table else "ERP"
            if group  != current_group:
                current_group = group
                print("--------------------------------------")
                print(f"Loading {group} Tables")
                print("--------------------------------------")
            file_path = f"{DATA_DIR}/{csv_file}"
            try:
                start = time.time()
                print(f">> Truncating Table: {table}")
                cursor.execute(f"TRUNCATE TABLE {table};")

                print(f">> Inserting Data Into: {table}")
                with open(file_path, "r") as f:
                    cursor.copy_expert(
                        f"COPY {table} FROM STDIN WITH (FORMAT csv, HEADER true)",
                        f
                    )
                duration = int(time.time() - start)
                print(f">> Load Duration: {duration} seconds")
                print(">> ----------------------------------")

            except Exception as e:
                print("=======================================")
                print(f"ERROR OCCURRED WHILE LOADING {table}")
                print(f"Error Message : {e}")
                print(">> ====================================")
        cursor.close()
        conn.close()


    except Exception as e:
        print("==========================================")
        print("ERROR: Could not connect to the database")
        print(f"Error Message : {e}")
        print("==========================================")
        return
    batch_duration = int(time.time() - batch_start)
    print("==========================================")
    print("Loading Bronze Layer is Completed")
    print(f" - Total Load Duration: {batch_duration} seconds")
    print("==================================================")



# ======================================================================
# Entry Point
# ======================================================================

if __name__== "__main__":
    load_bronze()
