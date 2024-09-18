--- returns the backup chain for a supplied database
--- 9.18.2024

USE msdb;
GO

SELECT 
    bs.database_name,
    bs.backup_start_date AS backup_start_time,
    bs.backup_finish_date AS backup_finish_time,
    CASE 
        WHEN bs.type = 'D' AND bs.is_copy_only = 1 THEN 'Copy-Only Full Backup'
        WHEN bs.type = 'D' THEN 'Full Backup'
        WHEN bs.type = 'I' THEN 'Differential Backup'
        WHEN bs.type = 'L' AND bs.is_copy_only = 1 THEN 'Copy-Only Log Backup'
        WHEN bs.type = 'L' THEN 'Log Backup'
        ELSE 'Other'
    END AS backup_type,
    bs.first_lsn,
    bs.last_lsn,
    bs.checkpoint_lsn,
    bs.database_backup_lsn
FROM msdb.dbo.backupset AS bs
WHERE bs.database_name = 'YOUR DATABASE NAME'
ORDER BY bs.backup_finish_date DESC;
