/*
=============================================================
Database and Schema Setup
=============================================================
Purpose:
    This script creates a new database named 'DataWarehouse'. 
    If the database is already present, it is first removed and then recreated.
    In addition, the script establishes three schemas within the database:
    'bronze', 'silver', and 'gold'.

IMPORTANT:
    Executing this script will result in the deletion of the entire 'DataWarehouse' database if it exists.
    All existing data in the database will be lost permanently.
    Please proceed with caution and ensure you have comprehensive backups before running this script.
*/

--USE master;
--GO

-- Drop and recreate the 'DataWarehouse' database
/*
Restricts Connections:
Switching to single-user mode forces all users to disconnect, allowing only one connection to the database. This is important because the DROP DATABASE command requires that no other connections are interfering. If multiple connections are active, the drop operation can fail or produce errors.

Immediate Transaction Rollback:
The option WITH ROLLBACK IMMEDIATE terminates any running transactions immediately by rolling them back. This prevents open transactions from blocking the operation, ensuring that all locks and running sessions are cleared so the database can be safely dropped.
*/
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
