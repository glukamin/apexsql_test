SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_MaintSalesByMonth]
(
	@DateBegin datetime, 
	@DateEnd datetime
)
AS

select 
	Month = dbo.ICE_GetMonthName(T.Month), 
	T.Total 
	
from 
(
	Select Top 100 percent 
		Month = Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date), 
		Total = convert(float, Sum(ROUND(ICE_Orders.Total, 0))) 
	
	from 
		ICE_Orders inner join ICE_Extension_Details on ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID

	where 
		ICE_Orders.Order_Status_ID in (0, 1, 2, 4) and 
		ICE_Orders.Order_Date >= @DateBegin and 
		ICE_Orders.Order_Date <= @DateEnd 
	
	Group by 
		Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) 
	
	order by 
		Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)
		
) AS T
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MaintSalesByMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MaintSalesByMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MaintSalesByMonth]
	TO [davor.dumeljic]
GO
