/*
    DBCC CHECKDB WITH REPAIR_REBUILD:
    ---------------------------------
    This option performs a safe repair that does not result in data loss. 
    It is used to fix minor database corruption issues such as:
    - Rebuilding corrupt nonclustered indexes.
    - Fixing allocation issues and deallocating corrupted text objects.

    Key Points:
    - REPAIR_REBUILD is the safer option because it does not cause data loss.
    - It primarily addresses corruption in nonclustered indexes and minor allocation issues.
    - This operation requires the database to be in SINGLE_USER mode during execution.

    Use Case:
    - If DBCC CHECKDB reports minor corruption (e.g., index corruption) that can be resolved 
      without any risk of losing data.
    - Run a full backup of the database before attempting any repairs.

    Example:
    ALTER DATABASE [YourDatabaseName] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DBCC CHECKDB ([YourDatabaseName]) WITH REPAIR_REBUILD;
    ALTER DATABASE [YourDatabaseName] SET MULTI_USER;
*/

/*
    DBCC CHECKDB WITH REPAIR_ALLOW_DATA_LOSS:
    -----------------------------------------
    This option attempts to repair severe corruption in the database, 
    but it may result in data loss. It should be used only as a last resort, 
    as it:
    - Tries to fix major issues such as corrupt clustered indexes, page allocation failures, 
      or data integrity problems.
    - May remove corrupted data if it cannot be repaired, resulting in data loss.

    Key Points:
    - This is a high-risk option and should only be used when there is no other choice, 
      such as when restoring from a backup is not possible.
    - REPAIR_ALLOW_DATA_LOSS requires the database to be in SINGLE_USER mode.
    - It is strongly recommended to perform a full backup before using this option, as it may 
      delete corrupted data.

    Use Case:
    - When DBCC CHECKDB reports severe corruption that cannot be fixed with REPAIR_REBUILD, 
      and restoring from a backup is not an option.
    - Only use this option if you are willing to accept potential data loss.

    Example:
    ALTER DATABASE [YourDatabaseName] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DBCC CHECKDB ([YourDatabaseName]) WITH REPAIR_ALLOW_DATA_LOSS;
    ALTER DATABASE [YourDatabaseName] SET MULTI_USER;
*/
