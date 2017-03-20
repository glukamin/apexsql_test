SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[ICE_GetLicensePrice_test]
(
	@Product_ID int, 
	@License_Type_ID int, 
	@Maintenance_ID int, 
	@Qty int
)
returns money
As
BEGIN
	if ISNULL((Select Product_ID from ICE_Products where Product_ID=ISNULL(@Product_ID, 0)), 0) = 0
	return 0

	if ISNULL(@Qty, 0)<=0
	return 0

	DECLARE @BasePrice money, @MaintenancePrice money, @MaintenancePercentage float, @LicensePercentage float, @ResultPrice money

	Set @BasePrice = ISNULL((Select Price from ICE_Products where Product_ID=ISNULL(@Product_ID, 0)), 0)

	IF (@Product_ID NOT IN (300307430, 300304416))
	BEGIN
		--Discount for first year Maintenance for all bundle products
		IF ( (
			/*Universal Studio*/ @Product_ID = 204978 OR 
			/*Developer Studio*/ @Product_ID = 141582 OR 
			/*DBA Studio*/ @Product_ID = 300267312 OR 
			/*SSMS Plus*/ @Product_ID = 300235435 OR 
			/*Comparison Studio*/ @Product_ID = 300299401 OR
			/*Recovery Studio*/ @Product_ID = 300299403
		  ) AND @Maintenance_ID > 0)
		BEGIN
			SET @Maintenance_ID = @Maintenance_ID-1
		END

		Set @Maintenance_ID = (select Max(Maintenance_ID) from ICE_Maintenances where Maintenance_ID<=ISNULL(@Maintenance_ID, 0))
		Set @MaintenancePercentage = ISNULL((Select Percentage from ICE_Maintenances where Maintenance_ID=@Maintenance_ID) ,0)
		Set @MaintenancePrice = @BasePrice + ROUND(@BasePrice * @Maintenance_ID * @MaintenancePercentage, 0)
		Set @LicensePercentage = ISNULL((Select Top 1 Percentage from ICE_Product_Licenses Where Product_ID=ISNULL(@Product_ID, 0) and License_Type_ID=ISNULL(@License_Type_ID, 0) And License_Count<=ISNULL(@Qty, 0) order by License_Count desc), ISNULL((select Price from ICE_Products where Product_ID=@Product_ID), 0))
		Set @ResultPrice = ROUND(@MaintenancePrice * @LicensePercentage, 0)
		
	END
	ELSE --partner tools, use different maintenance schema
		BEGIN
			--Discount for first year Maintenance for all bundle products
		IF ( (
			@Product_ID = 300304416 --Hyperbac
		  ) AND @Maintenance_ID > 0)
			BEGIN
				SET @Maintenance_ID = @Maintenance_ID-1
			END
			
			Set @Maintenance_ID = (select Max(Maintenance_ID) from ICE_Maintenances_Partners where Maintenance_ID<=ISNULL(@Maintenance_ID, 0) and ICE_Maintenances_Partners.Product_ID = @Product_ID)
			Set @MaintenancePercentage = ISNULL((Select Percentage from ICE_Maintenances_Partners where Maintenance_ID=@Maintenance_ID and ICE_Maintenances_Partners.Product_ID = @Product_ID ) ,0)
			Set @MaintenancePrice = @BasePrice + ROUND(@BasePrice * @Maintenance_ID * @MaintenancePercentage, 0)
			Set @LicensePercentage = ISNULL((Select Top 1 Percentage from ICE_Product_Licenses Where Product_ID=ISNULL(@Product_ID, 0) and License_Type_ID=ISNULL(@License_Type_ID, 0) And License_Count<=ISNULL(@Qty, 0) order by License_Count desc), ISNULL((select Price from ICE_Products where Product_ID=@Product_ID), 0))
			Set @ResultPrice = ROUND(@MaintenancePrice * @LicensePercentage, 0)
			
		END
	return @ResultPrice
	
END





GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLicensePrice_test]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLicensePrice_test]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLicensePrice_test]
	TO [davor.dumeljic]
GO
