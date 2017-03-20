SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_ProductQtySalesByMonth](@ProductID int, @DateBegin datetime, @DateEnd datetime)
as
Select
	dbo.ICE_GetMonthName(T.Month) as Month, T.TotalQty
from
(
	Select top 100 percent
		Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) as Month,
		Sum(ICE_Order_Details.Qty) as TotalQty
	from 
		ICE_Orders inner join ICE_Order_Details on ICE_Orders.Order_ID=ICE_Order_Details.Order_ID
		inner join ICE_Products on ICE_Order_Details.Product_ID=ICE_Products.Product_ID 
	where 
		ICE_Orders.Order_Status_ID in (0,1,2,4) and 
		ICE_Orders.Order_Date >= @DateBegin and 
		ICE_Orders.Order_Date <= @DateEnd And 
		ICE_Order_Details.Product_ID = @ProductID
	group by
		Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)
	order by
		Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)
) T
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductQtySalesByMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductQtySalesByMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductQtySalesByMonth]
	TO [davor.dumeljic]
GO
