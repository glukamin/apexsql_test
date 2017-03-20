SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[ICE_sp_AvgQtyPerCustomer](@DateBegin datetime, @DateEnd datetime)
as
select Round(Avg(convert(float, Qty)), 2) as Avg from
(Select Sum(Qty) as Qty from ICE_Order_Details inner join ICE_Orders on ICE_Order_Details.Order_Id=ICE_Orders.Order_ID
where ICE_Orders.Order_date>=@DateBegin and ICE_Orders.Order_Date<=@DateEnd
group by ICE_Orders.Cust_ID
) T
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_AvgQtyPerCustomer]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_AvgQtyPerCustomer]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_AvgQtyPerCustomer]
	TO [davor.dumeljic]
GO
