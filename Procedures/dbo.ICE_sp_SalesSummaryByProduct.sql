SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ICE_sp_SalesSummaryByProduct]
(
	@Product_ID int, 
	@DateBegin datetime, 
	@DateEnd datetime
)
as

SELECT * FROM 
(

	Select 
		ICE_Orders.Order_ID, 
		Order_Date = CONVERT(VARCHAR, ICE_Orders.Order_Date, 111),
		Type = (SELECT 
					Type 
				FROM 
					ICE_Order_Types 
				WHERE 
					ICE_Order_Types.Order_Type_ID = ICE_Orders.Order_Type_ID
				),
		Status = (SELECT Status FROM ICE_Order_Status WHERE ICE_Order_Status.Order_Status_ID=ICE_Orders.Order_Status_ID),
		License_To = ICE_Orders.Reg_Name,
		ICE_Orders.Invoice,
		Maintenance = ICE_Order_Details.Maintenance_ID,
		Total = Round((ICE_Order_Details.Total * (1 - (ISNULL(ICE_Orders.Discount, 0)/100))), 0)
		
	from 
		ICE_Orders inner join 
		ICE_Order_Details on ICE_Orders.Order_ID = ICE_Order_Details.Order_ID
		
	where 
		Order_Status_ID in (0,1,2,4) And 
		Order_Date >= @DateBegin And 
		Order_Date < @DateEnd + 1 And 
		ICE_Order_Details.Product_ID = @Product_ID 
		
	UNION ALL
	
	
	Select 
		ICE_Orders.Order_ID, 
		Order_Date = CONVERT(VARCHAR, ICE_Orders.Order_Date, 111),
		Type = (SELECT Type FROM ICE_Order_Types WHERE ICE_Order_Types.Order_Type_ID=ICE_Orders.Order_Type_ID),
		Status = (SELECT Status FROM ICE_Order_Status WHERE ICE_Order_Status.Order_Status_ID=ICE_Orders.Order_Status_ID),
		License_To = ICE_Orders.Reg_Name,
		ICE_Orders.Invoice,
		Maintenance = ICE_Extension_Details.Maintenance_ID,
		Total = Round((ICE_Extension_Details.Total * (1 - (ISNULL(ICE_Orders.Discount, 0)/100))), 0)
		
	from 
		ICE_Orders inner join 
		ICE_Extension_Details on ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID
		
	where 
		Order_Status_ID in (0,1,2,4) And 
		Order_Date >= @DateBegin And 
		Order_Date < @DateEnd + 1 And 
		ICE_Extension_Details.Product_ID = @Product_ID 
		
) AS T
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesSummaryByProduct]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesSummaryByProduct]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesSummaryByProduct]
	TO [davor.dumeljic]
GO
