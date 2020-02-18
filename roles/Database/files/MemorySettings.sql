
--Automation for Memory Settings
DECLARE @Physical_Server_memory int
DECLARE @MaxServerMemory int

if ((SELECT value From sys.configurations  where configuration_id=1544))>=2147483647
BEGIN
--Set Physical Amount in MB
SELECT @Physical_Server_memory=[total_physical_memory_kb]/1024
from [master].[sys].[dm_os_sys_memory]

	select @MaxServerMemory = @Physical_Server_memory *.70
	
--Adjust the max and min server memory 	

EXEC sys.sp_configure N'show advanced options', N'1'  RECONFIGURE WITH OVERRIDE
EXEC sys.sp_configure 'max server memory', @MaxServerMemory
EXEC sys.sp_configure N'show advanced options', N'0'  RECONFIGURE WITH OVERRIDE
reconfigure
END

-- Uncomment the below lines if you want to view the output in SSMS
--SELECT @Physical_Server_memory
--select @MaxServerMemory
