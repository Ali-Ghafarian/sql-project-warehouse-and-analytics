/*
Description: 
-This script will convert multiple columns from NVARCHAR to DATE data type in a specified table.
-We will create a stored procedure for reusability and flexibility in converting multiple columns at once.
-The procedure will add a temporary column with the DATE data type, update it by converting the existing NVARCHAR value to a DATE, and then drop the original NVARCHAR column.
-Optionally, the procedure can display the column's current data type and the count of NULLs before dropping the original column.

-We will also verify the conversion by displaying the data type of the columns after the conversion.
*/

USE DataWarehouse;
GO

CREATE OR ALTER PROCEDURE bronze.sp_ConvertMultipleVarcharToDateValidated
    @TableName NVARCHAR(255),         -- Must include schema, e.g., 'bronze.crm_sales_details'
    @Columns NVARCHAR(MAX),           -- Comma-separated list of columns, e.g.: 'sls_order_dt,sls_ship_dt,sls_due_dt'
    @ConversionStyle INT = 105,         -- Default conversion style (can be changed; for YYYYMMDD use 112)
    @IncludeDataType BIT = 1,         -- Optionally display the data type after conversion
    @IncludeNullCount BIT = 1         -- Optionally display the NULL count after conversion
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        PRINT 'sp_ConvertMultipleVarcharToDateValidated Arguments:';
        PRINT '  @TableName: ' + @TableName;
        PRINT '  @Columns: ' + @Columns;
        PRINT '  @ConversionStyle (INT, default 105): ' + CAST(@ConversionStyle AS NVARCHAR(10));
        PRINT '  @IncludeDataType (BIT, default 1): ' + CAST(@IncludeDataType AS NVARCHAR(10));
        PRINT '  @IncludeNullCount (BIT, default 1): ' + CAST(@IncludeNullCount AS NVARCHAR(10));

        -- Split the comma-separated column names into a table variable
        DECLARE @cols TABLE (col NVARCHAR(255));
        INSERT INTO @cols (col)
        SELECT LTRIM(RTRIM(value))
        FROM STRING_SPLIT(@Columns, ',');

        DECLARE @col NVARCHAR(255);
        DECLARE @sql NVARCHAR(MAX);

        DECLARE cur CURSOR LOCAL FAST_FORWARD FOR
            SELECT col FROM @cols;

        OPEN cur;
        FETCH NEXT FROM cur INTO @col;
        WHILE @@FETCH_STATUS = 0
        BEGIN
            PRINT 'Converting column: ' + @col;

            -- 1. Add a temporary column with the DATE data type
            SET @sql = 'ALTER TABLE ' + @TableName + ' ADD temp_' + @col + ' DATE;';
            PRINT @sql;
            EXEC sp_executesql @sql;

            -- 2. Update the temporary column by converting the existing varchar value to a date
            SET @sql = 'UPDATE ' + @TableName + ' SET temp_' + @col + ' = TRY_CONVERT(DATE, ' + @col + ', ' + CAST(@ConversionStyle AS NVARCHAR) + ');';
            PRINT @sql;
            EXEC sp_executesql @sql;

            -- 3. Optionally display the column's current data type and the count of NULLs
            IF @IncludeDataType = 1 OR @IncludeNullCount = 1
            BEGIN
                SET @sql = 'SELECT ''' + @col + ''' AS ColumnName, ' +
                           'DATA_TYPE, ' +
                           'COLUMN_DEFAULT, ' +
                           '(SELECT COUNT(*) FROM ' + @TableName + ' WHERE ' + @col + ' IS NULL) AS NullCount ' +
                           'FROM INFORMATION_SCHEMA.COLUMNS ' +
                           'WHERE TABLE_NAME = ''' + PARSENAME(@TableName, 1) + ''' ' +
                           'AND COLUMN_NAME = ''' + @col + '''';
                PRINT @sql;
                EXEC sp_executesql @sql;
            END

            -- 4. Drop the original varchar column
            SET @sql = 'ALTER TABLE ' + @TableName + ' DROP COLUMN ' + @col + ';';
            PRINT @sql;
            EXEC sp_executesql @sql;

            -- 5. Rename the temporary column back to the original column name
            SET @sql = 'EXEC sp_rename ''' + @TableName + '.temp_' + @col + ''', ''' + @col + ''', ''COLUMN'';';
            PRINT @sql;
            EXEC sp_executesql @sql;

            FETCH NEXT FROM cur INTO @col;
        END

        CLOSE cur;
        DEALLOCATE cur;

        COMMIT TRANSACTION;
        PRINT 'sp_ConvertMultipleVarcharToDateValidated procedure completed successfully for all specified columns.';
    END TRY
    BEGIN CATCH
        PRINT 'Error encountered: ' + ERROR_MESSAGE();
        IF XACT_STATE() <> 0
            ROLLBACK TRANSACTION;
    END CATCH;
END;
GO


------------------------------------------------------------------------------------------------------------------------
-- Usage:
EXEC bronze.sp_ConvertMultipleVarcharToDateValidated 'bronze.crm_sales_details', 'sls_order_dt,sls_ship_dt,sls_due_dt' ;
------------------------------------------------------------------------------------------------------------------------
--validate the conversion
SELECT COLUMN_NAME, DATA_TYPE,TABLE_SCHEMA
FROM INFORMATION_SCHEMA.COLUMNS

SELECT TOP 5 * FROM bronze.crm_sales_details;