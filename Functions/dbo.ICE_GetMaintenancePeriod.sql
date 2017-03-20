SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[ICE_GetMaintenancePeriod](@DateBEgin datetime, @DateEnd datetime)
returns int
As
begin
declare @result int, @MaxMaint int
select @MaxMaint = ISNULL(Max(Maintenance_ID), 3) from ICE_Maintenances
if @DateBegin is null or @DateEnd is null
	return 0
if @DateBegin >= @DateEnd
	return 0
set @result = convert(int, Round(convert(float, datediff(d, @DateBegin, @DateEnd))/365, 0))
if @result <= 0
	set @result = 1
if @result > @MaxMaint
	set @result = @MaxMaint
return @result
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetMaintenancePeriod]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetMaintenancePeriod]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetMaintenancePeriod]
	TO [davor.dumeljic]
GO
