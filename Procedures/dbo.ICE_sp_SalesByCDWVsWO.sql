SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
Create procedure dbo.ICE_sp_SalesByCDWVsWO(@DateBegin datetime, @DateEnd datetime)
as
Select Case ICE_Order_Details.CD when 1 then 'W' Else 'W/O' End as CDType, Sum(ICE_Order_Details.Total) as Total
from ICE_Orders inner join ICE_Order_Details on ICE_Orders.Order_ID=ICE_Order_Details.Order_ID inner join ICE_Products on ICE_Order_Details.Product_ID=ICE_Products.Product_ID 
where ICE_Orders.Order_Status_ID in (0,1,2,4) and ICE_Orders.Order_Date >= @DateBegin and ICE_Orders.Order_Date <= @DateEnd 
Group By Case ICE_Order_Details.CD when 1 then 'W' Else 'W/O' End
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByCDWVsWO]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByCDWVsWO]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByCDWVsWO]
	TO [davor.dumeljic]
GO
