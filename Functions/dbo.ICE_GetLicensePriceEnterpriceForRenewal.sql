SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ICE_GetLicensePriceEnterpriceForRenewal]
(
	@Product_ID int, 
	@OrderID int, 
	@Extension_Order_Detail_ID int,
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
		
    DECLARE @License_Type_ID int, @BasePrice money, @MaintenancePrice money, @MaintenancePercentage float, @LicensePercentage float, @ResultPrice money, @ResultPrice2 money
	
	SET @License_Type_ID = ISNULL((SELECT iod.License_Type_ID FROM dbo.ICE_Order_Details iod INNER JOIN dbo.ICE_Orders io ON io.Discount = iod.Discount WHERE iod.Product_ID = @Product_ID AND iod.Order_ID = @OrderID),0)

	IF (@License_Type_ID NOT IN (0,1))
		BEGIN
			SET @BasePrice = ISNULL((SELECT iod.Total FROM dbo.ICE_Order_Details iod INNER JOIN dbo.ICE_Orders io ON io.Order_ID = iod.Order_ID WHERE iod.License_Type_ID = @License_Type_ID AND iod.Product_ID = @Product_ID AND iod.Order_ID = @OrderID),0)
			IF @Maintenance_ID = 1
				BEGIN
					SET @ResultPrice = @BasePrice * 0.25
				END 
			ELSE 
				BEGIN 
					IF @Maintenance_ID = 2 
						BEGIN
							SET @ResultPrice = @BasePrice * 0.5
						END 
					ELSE 
						BEGIN
							SET @ResultPrice = @BasePrice * 0.75
						END
				END
	END
	ELSE
		BEGIN
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
		SET @ResultPrice2 = ROUND(@MaintenancePrice * @LicensePercentage, 0)
		IF @Maintenance_ID = 1
				BEGIN
					SET @ResultPrice = @ResultPrice2 * 0.25
				END 
			ELSE 
				BEGIN 
					IF @Maintenance_ID = 2 
						BEGIN
							SET @ResultPrice = @ResultPrice2 * 0.5
						END 
					ELSE 
						BEGIN
							SET @ResultPrice = @ResultPrice2 * 0.75
						END
				END

	END
	RETURN @ResultPrice	
END
GO
