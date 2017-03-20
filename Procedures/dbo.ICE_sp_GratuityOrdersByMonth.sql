SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_GratuityOrdersByMonth]
(
	@DateBegin datetime, 
	@DateEnd datetime
)
AS

select 
	Month = dbo.ICE_GetMonthName(T.Month), 
	T.Count 
	
from 
(
	Select Top 100 percent 
		Month = Year(Order_Date) * 100 + Month(Order_Date), 
		Count = Count(*) 
	
	from 
		ICE_Orders 
	
	where 
		Order_Status_ID in (3) and 
		Order_Date >= @DateBegin and 
		Order_Date <= @DateEnd 
	
	Group by 
		Year(Order_Date) * 100 + Month(Order_Date) 
	
	order by 
		Year(Order_Date) * 100 + Month(Order_Date)
		
) AS T
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GratuityOrdersByMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GratuityOrdersByMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GratuityOrdersByMonth]
	TO [davor.dumeljic]
GO
