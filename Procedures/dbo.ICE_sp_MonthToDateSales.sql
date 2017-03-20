SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  [dbo].[ICE_sp_MonthToDateSales]
AS

SELECT 
	Total = Sum(ROUND(Total, 0)), 
	Extrapolate = CONVERT(VARCHAR, 
		CONVERT
		(
			money, 
			Round
			(
				SUM(Total) * 30.5 / DAY(GetDate()), 2)
			), 
			1
		)	
FROM 
	ICE_Orders 

WHERE
	Order_Status_ID IN (0,1,2,4) AND 
	Order_Date >= (SELECT dbo.ICE_GetFirstDateOfMonth(GETDATE())) AND 
	Order_Date <= (SELECT dbo.ICE_GetLastDateOfMonth(GETDATE())) 
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthToDateSales]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthToDateSales]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonthToDateSales]
	TO [davor.dumeljic]
GO
