/*
------------------------------------------------------------
Procedure Name: load_bronze

Purpose:
Loads fresh data into tables under the 'bronze' schema from cleaned CSV files.

What It Does:
- Clears existing records using TRUNCATE.
- Loads data using BULK INSERT from external file paths.
- Works on both CRM and ERP datasets.

Parameters:
- None

Returns:
- No return value. Just prints a success or error message.

How to Use:
EXEC bronze.load_bronze;
------------------------------------------------------------
*/

-- Save frequently used SQL code in stored procedures in database.

CREATE OR ALTER PROCEDURE bronze.load_bronze_layer_all AS
BEGIN
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
    BEGIN TRY
        SET @batch_start_time = GETDATE();
        PRINT '========================================================================================================================================================='; 
        PRINT 'Loading Bronze Layer';
        PRINT '=========================================================================================================================================================';
    
        PRINT '---------------------------------------------------------------------------------------------------------------------------------------------------------';
        PRINT 'Loading CRM Tables';
        PRINT '---------------------------------------------------------------------------------------------------------------------------------------------------------';
    

        SET @start_time = GETDATE(); 
        PRINT '>> Truncating Table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;
    
        PRINT '>> Inserting Data into Table: bronze.crm_cust_info';
        BULK INSERT bronze.crm_cust_info
        FROM 'D:\Deepak_Work\My Sql programs for google\New SQL Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info_cleaned.csv'
        WITH (
            FIRSTROW = 2, 
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK   
        );
        SET @end_time = GETDATE(); 
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
        PRINT '-----------';

        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;
    
        PRINT '>> Inserting Data into Table: bronze.crm_prd_info';
        BULK INSERT bronze.crm_prd_info
        FROM 'D:\Deepak_Work\My Sql programs for google\New SQL Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info_cleaned.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE(); 
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
        PRINT '-----------';


        SET @start_time = GETDATE(); 
        PRINT '>> Truncating Table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;
    
        PRINT '>> Inserting Data into Table: bronze.crm_sales_details';
        BULK INSERT bronze.crm_sales_details
        FROM 'D:\Deepak_Work\My Sql programs for google\New SQL Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE(); 
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
        PRINT '-----------';


        PRINT '---------------------------------------------------------------------------------------------------------------------------------------------------------';
        PRINT 'Loading CRP Tables';
        PRINT '---------------------------------------------------------------------------------------------------------------------------------------------------------';
        
        
        SET @start_time = GETDATE();
        PRINT '>> Truncating Table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;
    
        PRINT '>> Inserting Data into Table: bronze.erp_cust_az12';
        BULK INSERT bronze.erp_cust_az12
        FROM 'D:\Deepak_Work\My Sql programs for google\New SQL Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE(); 
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
        PRINT '-----------';


        SET @start_time = GETDATE(); 
        PRINT '>> Truncating Table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;
    
        PRINT '>> Inserting Data into Table: bronze.erp_loc_a101';
        BULK INSERT bronze.erp_loc_a101
        FROM 'D:\Deepak_Work\My Sql programs for google\New SQL Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE(); 
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
        PRINT '-----------';


        SET @start_time = GETDATE(); 
        PRINT '>> Truncating Table: bronze.erp_px_cat_glv2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
    
        PRINT '>> Inserting Data into Table: bronze.erp_px_cat_glv2';
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'D:\Deepak_Work\My Sql programs for google\New SQL Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );
        SET @end_time = GETDATE(); 
        PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
        PRINT '-----------';

        SET @batch_end_time = GETDATE();
        PRINT '=============================================';
        PRINT 'Loading Bronze Layer is Completed';
        PRINT '>> Total Load Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'seconds';
        PRINT '=============================================';
    END TRY
    BEGIN CATCH
        PRINT '=========================================================================================================================================================';
        PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
        PRINT 'Error Message' + Error_MESSAGE();
        PRINT 'Error Message' + CAST (Error_NUMBER() AS NVARCHAR);
        PRINT 'Error Message' + CAST (Error_STATE() AS NVARCHAR);
        PRINT '=========================================================================================================================================================';

    END CATCH
END

EXEC bronze.load_bronze_layer_all;

-- Add PRINTS: Add Prints to track execution, debug issues, and understand its flow.
-- Add TRY...CATCH: Ensures error handling, data integrity and issue logging for easier debugging. 
-- TRY..CATCH: SQL runs TRY block, and if it fails, it runs the CATCH block to handle the error.
-- Track ETL Duration: Helps to identify bottlenecks, optimize perfomance, monitor trends, detect issues.
-- DATEDIFF(): calculates the difference between two dates, retuen days, months or years.
-- Calculate the Duration of Loading Bronze Layer "Whole Batch".
