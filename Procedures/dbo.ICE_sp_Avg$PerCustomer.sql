SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ICE_sp_Avg$PerCustomer]
(
	@DateBegin datetime, 
	@DateEnd datetime
)
as
select Round(Avg(T.Total), 2) as Avg 
from 
(
	select Sum(Total) as Total 
	from ICE_Orders 
	where Order_Date>=@DateBegin and Order_Date<=@DateEnd and Order_Status_ID in (0, 1, 2, 4)
	group by ICE_Orders.Cust_ID
) T
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Avg$PerCustomer]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Avg$PerCustomer]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Avg$PerCustomer]
	TO [davor.dumeljic]
GO
