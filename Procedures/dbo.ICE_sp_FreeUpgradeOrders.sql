SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_FreeUpgradeOrders
(
	@DateStart	datetime,
	@DateEnd	datetime
)
AS
BEGIN

	SET @DateEnd = @DateEnd + ' 23:59:59'
	
	SELECT 	[Order_ID],
		[Order_Date],
		[Cust_ID],
		[Total],
		[License_To],
		[Reg_Name],
		[Notes],
		[Last_Name_Ship],
		[First_Name_Ship],
		[Email_Ship],
		[Company_Ship],
		[Phone_Ship],
		[Fax_Ship],
		[Address1_Ship],
		[City_Ship],
		[State_Ship],
		[Country_Ship],
		[Zip_Ship] 
	FROM ICE_Orders
	WHERE ICE_Orders.Free_Upgrades = 1 
	AND ICE_Orders.Order_Date BETWEEN @DateStart AND @DateEnd
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_FreeUpgradeOrders]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_FreeUpgradeOrders]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_FreeUpgradeOrders]
	TO [davor.dumeljic]
GO
