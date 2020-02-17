Declare @Adhocworkloads tinyint
DECLARE @DefOptAdhoc sql_variant

SELECT @DefOptAdhoc = (c.value) From sys.configurations c where c.configuration_id=1581
--SELECT @DefOptAdhoc  -- use this to print the output in SSMS

SELECT  @Adhocworkloads= Adhoc_Plan_MB*100.0 / Total_Cache_MB 
FROM(
select sum(case 
when objtype='adhoc'
then CONVERT(float,size_in_bytes)
ELSE 0 END) / 1048576.0 Adhoc_Plan_MB,
SUM(CONVERT(float,size_in_bytes)) / 1048576.0 Total_Cache_MB
FROM SYS.dm_exec_cached_plans) T
-- SELECT @Adhocworkloads
if (@Adhocworkloads>20 and @DefOptAdhoc = 0)
BEGIN
EXEC sys.sp_configure N'show advanced options', N'1'  RECONFIGURE WITH OVERRIDE
EXEC sys.sp_configure N'optimize for ad hoc workloads', N'1'
RECONFIGURE WITH OVERRIDE
EXEC sys.sp_configure N'show advanced options', N'0'  RECONFIGURE WITH OVERRIDE
END

