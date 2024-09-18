--- 9.18.24
/*
    This query retrieves detailed information about all backup operations 
    performed on a specified SQL Server database from the [msdb].[dbo].[backupset] table.
    
    It returns:
    - The name of the database ([database_name])
    - Backup start and finish times ([backup_start_date], [backup_finish_date])
    - The type of backup (Full, Differential, Log, or Copy-Only variants)
    - Log Sequence Numbers (LSNs) including the first, last, checkpoint, and database backup LSNs
      ([first_lsn], [last_lsn], [checkpoint_lsn], [database_backup_lsn])

    The query also distinguishes between regular backups and copy-only backups for full and log backups.
    Copy-only backups are special backups that do not disrupt the normal backup chain 
    (e.g., for ad-hoc purposes like testing), making it easier to identify them in the backup history.

    The results are ordered by the [backup_finish_date] in descending order, showing the most recent backups first.

    Use this query to audit backup activity, track backup dependencies, and differentiate copy-only 
    backups from regular backups to ensure proper maintenance of backup chains.
*/

USE [msdb];
GO

SELECT 
    [bs].[database_name],
    [bs].[backup_start_date] AS [backup_start_time],
    [bs].[backup_finish_date] AS [backup_finish_time],
    CASE 
        WHEN [bs].[type] = 'D' AND [bs].[is_copy_only] = 1 THEN 'Copy-Only Full Backup'
        WHEN [bs].[type] = 'D' THEN 'Full Backup'
        WHEN [bs].[type] = 'I' THEN 'Differential Backup'
        WHEN [bs].[type] = 'L' AND [bs].[is_copy_only] = 1 THEN 'Copy-Only Log Backup'
        WHEN [bs].[type] = 'L' THEN 'Log Backup'
        ELSE 'Other'
    END AS [backup_type],
    [bs].[first_lsn],
    [bs].[last_lsn],
    [bs].[checkpoint_lsn],
    [bs].[database_backup_lsn]
FROM [msdb].[dbo].[backupset] AS [bs]
WHERE [bs].[database_name] = 'Your Database Name'
ORDER BY [bs].[backup_finish_date] DESC;
