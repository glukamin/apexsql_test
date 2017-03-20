SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_SalesByProductDeveloperTools]
(
	@DateBegin datetime, 
	@DateEnd datetime
) 
as 

Select 
	Product_Name = dbo.ICE_GetProductAbvName(T.Product_ID), 
	Total = Sum(Total) 

from 
(
	Select 
		Product_ID  = ICE_Order_Details.Product_ID, 
		Total		= Sum
						(
							ICE_Order_Details.Total * 
							(1-(ISNULL(ICE_Orders.Discount, 0)/100))
						)
	from 
		ICE_Orders inner join 
		ICE_Order_Details on ICE_Orders.Order_ID=ICE_Order_Details.Order_ID inner join 
		ICE_Products on ICE_Order_Details.Product_ID = ICE_Products.Product_ID 

	where 
		ICE_Orders.Order_Status_ID in (0,1,2,4) and 
		ICE_Orders.Order_Date >= @DateBegin and 
		ICE_Orders.Order_Date <= @DateEnd and 
		ISNULL(ICE_Products.Is_Private, 0) = 0
		
	Group By 
		ICE_Order_Details.Product_ID
	
		
	UNION ALL
	
	
	Select 
		Product_ID  = ICE_Extension_Details.Product_ID, 
		Total		= Sum
						(
							ICE_Extension_Details.Total * 
							(1-(ISNULL(ICE_Orders.Discount, 0)/100))
						)
	from 
		ICE_Orders inner join 
		ICE_Extension_Details on ICE_Orders.Order_ID=ICE_Extension_Details.Order_ID inner join 
		ICE_Products on ICE_Extension_Details.Product_ID = ICE_Products.Product_ID 

	where 
		ICE_Orders.Order_Status_ID in (0,1,2,4) and 
		ICE_Orders.Order_Date >= @DateBegin and 
		ICE_Orders.Order_Date <= @DateEnd and 
		ISNULL(ICE_Products.Is_Private, 0) = 0
		
	Group By 
		ICE_Extension_Details.Product_ID
		
) AS T
 
where 
	dbo.ICE_IsDeveloperTool(T.Product_ID) = 1
	 
group by 
	T.Product_ID 
	
order by 
	dbo.ICE_GetProductAbvName(T.Product_ID) 
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByProductDeveloperTools]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByProductDeveloperTools]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByProductDeveloperTools]
	TO [davor.dumeljic]
GO
