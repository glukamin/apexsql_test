SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ICE_sp_MonthlyAvg$PerOrder](@DateBegin datetime, @DateEnd datetime)
AS

SELECT dbo.ICE_GetMonthName(Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)) as Month, 
Round(Avg(Total), 2) AS Avg 
FROM ICE_Orders 
WHERE Order_Date>=@DateBegin and Order_Date<=@DateEnd and Order_Status_ID in (0, 1, 2, 4)
Group by Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)
ORDER BY Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlyAvg$PerOrder]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlyAvg$PerOrder]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthlyAvg$PerOrder]
	TO [davor.dumeljic]
GO
