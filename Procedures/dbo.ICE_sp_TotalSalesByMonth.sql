SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_TotalSalesByMonth]
(
	@DateBegin datetime, 
	@DateEnd datetime
)
AS

select 
	MonthName = dbo.ICE_GetMonthName(T.Month), 
	T.Total
	
from 
(
	Select Top 100 percent 
		Month = Year(Order_Date) * 100 + Month(Order_Date), 
		Total = convert(float, Sum(ROUND(Total, 0)))
	from 
		ICE_Orders 
	
	where 
		Order_Status_ID in (0, 1, 2, 4) and 
		Order_Date >= @DateBegin and 
		Order_Date <= @DateEnd 
	
	Group by 
		Year(Order_Date) * 100 + Month(Order_Date) 
		
) AS T

Order by
	T.Month

GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalSalesByMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalSalesByMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalSalesByMonth]
	TO [davor.dumeljic]
GO
