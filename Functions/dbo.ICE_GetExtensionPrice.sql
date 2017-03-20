SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[ICE_GetExtensionPrice](@Product_ID int, @License_Type_ID int, @DateBegin datetime, @DateEnd datetime, @Qty int)
returns money
As
begin
if ISNULL((Select Product_ID from ICE_Products where Product_ID=ISNULL(@Product_ID, 0)), 0) = 0
	return 0
if ISNULL(@Qty, 0)<=0
	return 0
declare @Maintenance_ID int
set @Maintenance_ID = dbo.ICE_GetMaintenancePeriod(@DateBegin, @DateEnd)
declare @BasePrice money, @MaintenancePrice money, @MaintenancePercentage float, @LicensePercentage float, @ResultPrice money
Set @BasePrice = ISNULL((Select Price from ICE_Products where Product_ID=ISNULL(@Product_ID, 0)), 0)
Set @MaintenancePercentage = ISNULL((Select Percentage from ICE_Maintenances where Maintenance_ID=ISNULL(@Maintenance_ID, 0)) ,1)
Set @MaintenancePrice = ROUND(@BasePrice * @MaintenancePercentage * DateDiff(d, @DateBegin, @DateEnd)/365, 0)
Set @LicensePercentage = ISNULL((Select Top 1 Percentage from ICE_Product_Licenses Where Product_ID=ISNULL(@Product_ID, 0) and License_Type_ID=ISNULL(@License_Type_ID, 0) And License_Count<=ISNULL(@Qty, 0) order by License_Count desc), 1)
Set @ResultPrice = ROUND(@MaintenancePrice * @LicensePercentage, 0)
return @ResultPrice
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetExtensionPrice]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetExtensionPrice]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetExtensionPrice]
	TO [davor.dumeljic]
GO
