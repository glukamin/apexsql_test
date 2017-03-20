SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ICE_sp_MonthlySalesByTotalVs1Product](@DateBegin datetime, @DateEnd datetime)
as
Select 
dbo.ICE_GetMonthName(Year * 100 + T.Month) as Month, 
round(( Select Sum(ICE_Order_Details.Total) from ICE_Orders inner join ICE_Order_Details on ICE_Orders.Order_ID=ICE_Order_Details.Order_ID where Qty=1 and ICE_Orders.Order_Status_ID in (0,1,2,4) AND Year(Order_Date)=T.Year and Month(Order_Date)=T.Month ) * 100 / T.Total, 2) as [Percent] 
from
( Select top 100 percent Year(ICE_Orders.Order_Date) as Year, Month(ICE_Orders.Order_Date) as Month, Sum(ICE_Order_Details.Total) as Total 
from ICE_Orders inner join ICE_Order_Details on ICE_Orders.Order_ID=ICE_Order_Details.Order_ID inner join ICE_Products on ICE_Order_Details.Product_ID=ICE_Products.Product_ID 
where ICE_Orders.Order_Status_ID in (0,1,2,4) and ICE_Orders.Order_Date >= @DateBegin and ICE_Orders.Order_Date <= @DateEnd
group by Year(ICE_Orders.Order_Date), Month(ICE_Orders.Order_Date) order by Year(ICE_Orders.Order_Date), Month(ICE_Orders.Order_Date) ) T




GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlySalesByTotalVs1Product]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlySalesByTotalVs1Product]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlySalesByTotalVs1Product]
	TO [davor.dumeljic]
GO
