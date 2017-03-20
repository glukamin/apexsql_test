SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ICE_sp_MonthlyAvg$PerCustomer]
(
	@DateBegin datetime, 
	@DateEnd datetime
)
as
select dbo.ICE_GetMonthName(T.Month) as Month, Round(Avg(T.Total), 2) as Avg 
from (
	select Sum(Total) as Total, 
	Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) as Month 
	from ICE_Orders 
	where Order_Date>=@DateBegin and Order_Date<=@DateEnd and Order_Status_ID in (0, 1, 2, 4)
	group by ICE_Orders.Cust_ID, Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)
) T group by T.Month
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlyAvg$PerCustomer]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlyAvg$PerCustomer]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlyAvg$PerCustomer]
	TO [davor.dumeljic]
GO
