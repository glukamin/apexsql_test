SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ICE_sp_MonthlyAvgQtyPerCustomer](@DateBegin datetime, @DateEnd datetime)
as
select dbo.ICE_GetMonthName(T.Month) as Month, Round(Avg(convert(float, T.Qty)),2) as Avg from
(Select Sum(Qty) as Qty, Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) as Month from ICE_Order_Details inner join ICE_Orders on ICE_Order_Details.Order_Id=ICE_Orders.Order_ID
where ICE_Orders.Order_date>=@DateBegin and ICE_Orders.Order_Date<=@DateEnd
group by ICE_Orders.Cust_ID, Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)
) T group by T.Month
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlyAvgQtyPerCustomer]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlyAvgQtyPerCustomer]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlyAvgQtyPerCustomer]
	TO [davor.dumeljic]
GO
