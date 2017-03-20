SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpDBinfo] As 
Declare @low int
Declare @dbsize dec(10,2)
Declare @dbpath nvarchar(100)
Declare @logpath nvarchar(100)
Declare @dbfilesize dec(10,2)
Declare @logfilesize dec(10,2)
Declare @maxdbfilesize dec(10,2)
Declare @maxlogfilesize dec(10,2)
 
--Minimum Database Size
select @low = low from master.dbo.spt_values
			where type = N'E' and number = 1
--Calculation of current Database Size in MB
select @dbsize = (convert(dec(15),sum(size)) *  @low  / 1048576)
from [sysfiles]
--Actual File Size of Log and Data File
Select TOP 1 @dbpath = [filename] from [sysfiles] where groupid = 1
Select TOP 1 @logpath = [filename] from [sysfiles] where groupid = 0
Select @dbfilesize =  convert(dec(10,2),sum([size]))/128 from [sysfiles] where [filename] = @dbpath     --in MB
Select @logfilesize = convert(dec(10,2),sum([size]))/128 from [sysfiles] where [filename] = @logpath   --in MB
Select TOP 1 @maxdbfilesize = convert(dec(10,2),[maxsize])/128 from [sysfiles] where [filename] = @dbpath
Select TOP 1 @maxlogfilesize = convert(dec(10,2),[maxsize])/128 from [sysfiles] where [filename] = @logpath
If @maxdbfilesize = (-.01) Set @maxdbfilesize = -1
If @maxlogfilesize = (-.01) Set @maxlogfilesize = -1
 
---Creating Output Table
select 	@dbsize Databasesize, @dbpath DataLocation , @logpath LogLocation, 
	@dbfilesize DatabaseFileSize, @logfilesize Logfilesize,
	@maxdbfilesize MaxDBSize, @maxlogfilesize MazLogSize,
	ServerProperty('edition') Edition, 
	CASE ServerProperty('IsCluster') 
	 WHEN 0 THEN 'No Cluster'
	 WHEN 1 THEN 'Cluster'
 	 ELSE  'No Cluster/Unknown' 
	END Cluster,
	CASE ServerProperty('License_Type')
	 WHEN 'PER_SEAT' THEN 'Seat Licensing (' + Convert(nvarchar(5),ServerProperty('NumLicenses')) + ')'
	 WHEN 'Per_Processor' THEN 'Processor Licensing (' + Convert(nvarchar(5),ServerProperty('NumLicenses')) + ')'
	 ELSE 'Licensing Disabled / Unknown'
	END Licensing,
	ServerProperty('ProductLevel') PLevel
GO
GRANT EXECUTE
	ON [dbo].[wwfSpDBinfo]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpDBinfo]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpDBinfo]
	TO [davor.dumeljic]
GO
