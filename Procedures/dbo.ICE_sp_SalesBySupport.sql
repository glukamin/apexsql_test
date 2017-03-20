SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_SalesBySupport](@DateBegin datetime, @DateEnd datetime)
as
Begin
-- Returns 2 columns
-- Support '0 yr', '1 yr', ... etc
-- Total by Maintenance (group)
Select
	convert(varchar, ICE_Order_Details.Maintenance_ID) + ' yr' as Support,
	Sum(Round(ICE_Order_Details.Total, 0)) as Total
from
	ICE_Orders inner join ICE_Order_Details on ICE_Orders.Order_ID=ICE_Order_Details.Order_ID inner join ICE_Products on ICE_Order_Details.Product_ID=ICE_Products.Product_ID 
where
	ICE_Orders.Order_Status_ID in (0,1,2,4)
	and ICE_Orders.Order_Date >= @DateBegin
	and ICE_Orders.Order_Date <= @DateEnd 
Group By
	ICE_Order_Details.Maintenance_ID
End
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesBySupport]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesBySupport]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesBySupport]
	TO [davor.dumeljic]
GO
