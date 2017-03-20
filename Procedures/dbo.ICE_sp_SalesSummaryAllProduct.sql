SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_SalesSummaryAllProduct]
(
	@DateBegin	datetime, 
	@DateEnd	datetime
)
AS

SELECT * FROM 
(

	SELECT 
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
		Product = dbo.ICE_GetProductAbvName(ICE_Order_Details.Product_ID)+ Case ICE_Order_Details.License_Type_ID WHEN 0 THEN '' Else '-'+(SELECT License_Type FROM ICE_License_Types WHERE ICE_License_Types.License_Type_ID=ICE_Order_Details.License_Type_ID) End,
		Maintenance = ICE_Order_Details.Maintenance_ID,
		Total = Round((ICE_Order_Details.Total * (1 - (ISNULL(ICE_Orders.Discount, 0)/100))), 0)

	FROM 
		ICE_Orders INNER JOIN 
		ICE_Order_Details on ICE_Orders.Order_ID = ICE_Order_Details.Order_ID
		
	WHERE 
		Order_Status_ID in (0,1,2,4) And 
		Order_Date >= @DateBegin And Order_Date < @DateEnd + 1

		
	UNION ALL


	SELECT 
		ICE_Orders.Order_ID, 
		Order_Date = CONVERT(VARCHAR, ICE_Orders.Order_Date, 111),
		Type = (SELECT Type FROM ICE_Order_Types WHERE ICE_Order_Types.Order_Type_ID=ICE_Orders.Order_Type_ID),
		Status = (SELECT Status FROM ICE_Order_Status WHERE ICE_Order_Status.Order_Status_ID=ICE_Orders.Order_Status_ID),
		License_To = ICE_Orders.Reg_Name,
		ICE_Orders.Invoice,
		Product = dbo.ICE_GetProductAbvName(ICE_Extension_Details.Product_ID)+ ' Maint Renewal',
		Maintenance = ICE_Extension_Details.Maintenance_ID,
		Total = Round((ICE_Extension_Details.Total * (1 - (ISNULL(ICE_Orders.Discount, 0)/100))), 0)
		
	FROM 
		ICE_Orders INNER JOIN 
		ICE_Extension_Details on ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID
		
	WHERE 
		Order_Status_ID in (0,1,2,4) And 
		Order_Date >= @DateBegin And 
		Order_Date < @DateEnd + 1

) AS T 

ORDER BY 
	T.Order_ID
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesSummaryAllProduct]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesSummaryAllProduct]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesSummaryAllProduct]
	TO [davor.dumeljic]
GO
