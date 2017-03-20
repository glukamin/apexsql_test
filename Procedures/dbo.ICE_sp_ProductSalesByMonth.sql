SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[ICE_sp_ProductSalesByMonth](@ProductID int, @DateBegin datetime, @DateEnd datetime)
as
Select
	dbo.ICE_GetMonthName(T.Month) as [Mnth], Sum(T.Total) as Total
from
(
	Select top 100 percent
		Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) as Month, 
		ROUND(ICE_Order_Details.Total * (1-(ISNULL(ICE_Orders.Discount, 0)/100)), 0) as Total
	from 
		ICE_Orders inner join ICE_Order_Details on ICE_Orders.Order_ID=ICE_Order_Details.Order_ID
		inner join ICE_Products on ICE_Order_Details.Product_ID=ICE_Products.Product_ID 
	where 
		ICE_Orders.Order_Status_ID in (0,1,2,4) and 
		ICE_Orders.Order_Date >= @DateBegin and 
		ICE_Orders.Order_Date <= @DateEnd And 
		ICE_Order_Details.Product_ID = @ProductID
union all
	Select top 100 percent
		Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) as Month, 
		ROUND(ICE_Extension_Details.Total * (1-(ISNULL(ICE_Orders.Discount, 0)/100)), 0) as Total
	from 
		ICE_Orders inner join ICE_Extension_Details on ICE_Orders.Order_ID=ICE_Extension_Details.Order_ID
		inner join ICE_Products on ICE_Extension_Details.Product_ID=ICE_Products.Product_ID 
	where 
		ICE_Orders.Order_Status_ID in (0,1,2,4) and 
		ICE_Orders.Order_Date >= @DateBegin and 
		ICE_Orders.Order_Date <= @DateEnd And 
		ICE_Extension_Details.Product_ID = @ProductID
) T
group by
	T.Month
order by T.Month
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductSalesByMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductSalesByMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductSalesByMonth]
	TO [davor.dumeljic]
GO
