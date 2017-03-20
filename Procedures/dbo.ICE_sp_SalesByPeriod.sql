SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_SalesByPeriod](@DateBegin datetime, @DateEnd datetime)
AS
SET @DateEnd = DATEADD(day,1, @DateEnd )
Select 
	Total = convert(varchar, convert(money, Sum(ROUND(Total, 0))), 1)
from 
	ICE_Orders 
where 
	Order_Status_ID in (0,1,2,4) and 
	Order_Date >= @DateBegin and 
	Order_Date < @DateEnd 
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByPeriod]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByPeriod]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByPeriod]
	TO [davor.dumeljic]
GO
