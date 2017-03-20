SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ICE_GetLicensePrice]
(
	@Product_ID int, 
	@License_Type_ID int, 
	@Maintenance_ID int, 
	@Qty int
)
returns money
As
BEGIN
    IF ISNULL((Select Product_ID from ICE_Products where Product_ID=ISNULL(@Product_ID, 0)), 0) = 0
	   RETURN 0

    IF ISNULL(@Qty, 0)<=0
	   RETURN 0
	
	IF (@License_Type_ID NOT IN (0,1))
		RETURN 0

    DECLARE @BasePrice money, @MaintenancePrice money, @MaintenancePercentage float, @LicensePercentage float, @ResultPrice money

    SET @BasePrice = ISNULL((Select Price from ICE_Products where Product_ID=ISNULL(@Product_ID, 0)), 0)
	
    IF (@Product_ID NOT IN (300307430, 300304416)) --all ApexSQL products; not Partner prods
	   BEGIN
		  Set @Maintenance_ID = (select Max(Maintenance_Price_ID) from ICE_Maintenances_Price where Maintenance_Price_ID<=ISNULL(@Maintenance_ID, 0))
		  Set @MaintenancePercentage = ISNULL((Select Percentage from ICE_Maintenances_Price where Maintenance_Price_ID=@Maintenance_ID) ,0)
	   END
    ELSE --partner products which use a different maintenance structure
	   BEGIN
		  Set @Maintenance_ID = (select Max(Maintenance_ID) from ICE_Maintenances_Partners where Maintenance_ID<=ISNULL(@Maintenance_ID, 0) and ICE_Maintenances_Partners.Product_ID = @Product_ID)
		  Set @MaintenancePercentage = ISNULL((Select Percentage from ICE_Maintenances_Partners where Maintenance_ID=@Maintenance_ID and ICE_Maintenances_Partners.Product_ID = @Product_ID ) ,0)
	   END
		
    SET @MaintenancePrice = @BasePrice + ROUND(@BasePrice * @Maintenance_ID * @MaintenancePercentage, 0)
    SET @LicensePercentage = ISNULL((Select Top 1 Percentage from ICE_Product_Licenses Where Product_ID=ISNULL(@Product_ID, 0) and License_Type_ID=ISNULL(@License_Type_ID, 0) And License_Count<=ISNULL(@Qty, 0) order by License_Count desc), ISNULL((select Price from ICE_Products where Product_ID=@Product_ID), 0))
    SET @ResultPrice = ROUND(@MaintenancePrice * @LicensePercentage, 0)
    RETURN @ResultPrice	
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLicensePrice]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLicensePrice]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLicensePrice]
	TO [davor.dumeljic]
GO
