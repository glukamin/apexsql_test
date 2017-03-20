SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_TotalSalesByYear]
(
	@DateBegin datetime, 
	@DateEnd datetime
)
AS

select 
	T.Year, 
	T.Total 

from 
(
	Select Top 100 percent 
		[Year] = Year(Order_Date), 
		Total = convert(float, Sum(ROUND(Total, 0)))
		
	from 
		ICE_Orders 
	
	where 
		Order_Status_ID in (0,1,2,4) and 
		Order_Date >=@DateBegin and 
		Order_Date<=@DateEnd 
	
	Group by 
		Year(Order_Date) 
	
) T order by T.Year
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalSalesByYear]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalSalesByYear]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalSalesByYear]
	TO [davor.dumeljic]
GO
