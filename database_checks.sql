/*
    This script runs the DBCC CHECKDB command to check the logical and physical 
    integrity of all objects in the specified SQL Server database. It helps ensure 
    that the database is free of corruption and that all tables, indexes, and other 
    database structures are consistent.

    Key Features:
    - Verifies database page and extent allocation.
    - Ensures that tables, indexes, and relationships are logically sound.
    - Detects any physical database corruption or structural issues.

    You can modify the script to include additional options such as:
    - NO_INFOMSGS: Suppresses informational messages.
    - ALL_ERRORMSGS: Displays all error messages.
    - PHYSICAL_ONLY: Focuses on physical consistency checks to reduce performance impact.
    - TABLOCK: Uses table-level locking instead of the default short-term locks.

    Best Practices:
    - Run DBCC CHECKDB regularly as part of your database maintenance plan.
    - Consider scheduling it during off-peak hours to avoid performance impacts on production environments.
    - Always have a recent backup before running any repair option.

    Example Usage:
    Replace '[YourDatabaseName]' with the specific database name you want to check.
*/

-- Basic DBCC CHECKDB for full integrity check (with no options)
DBCC CHECKDB ([YourDatabaseName]);

-- DBCC CHECKDB with NO_INFOMSGS to suppress informational messages
DBCC CHECKDB ([YourDatabaseName]) WITH NO_INFOMSGS;

-- DBCC CHECKDB with ALL_ERRORMSGS to show all error messages
DBCC CHECKDB ([YourDatabaseName]) WITH ALL_ERRORMSGS;

-- DBCC CHECKDB with PHYSICAL_ONLY for faster physical consistency checks
DBCC CHECKDB ([YourDatabaseName]) WITH PHYSICAL_ONLY;

-- DBCC CHECKDB using TABLOCK for reduced contention (use in high-transaction environments)
DBCC CHECKDB ([YourDatabaseName]) WITH TABLOCK;

