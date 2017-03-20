SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ICE_sp_MonhlySalesWithMaint] 
	
( 
@DateBegin datetime, 
@DateEnd datetime 
) 
AS 

SELECT  
Maint.Month AS Month, 
CONVERT(varchar(10), ROUND(Maint.Total/Total.Total * 100,2)) AS SalesWithMaint
FROM 
( 
	SELECT Top 100 percent 
	Month = dbo.ICE_GetMonthName(Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)), 
	Total = convert(float, Sum(ROUND(ICE_Orders.Total, 0))) 
	FROM 
	ICE_Orders 
	INNER JOIN ICE_Extension_Details on ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID 

	WHERE 
	ICE_Orders.Order_Status_ID in (0, 1, 2, 4) and 
	ICE_Orders.Order_Date >= @DateBegin and 
	ICE_Orders.Order_Date <= @DateEnd 

	GROUP BY
	Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) 

	ORDER BY
	Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) 
) AS Maint,

( 
	SELECT Top 100 percent 
	Month = dbo.ICE_GetMonthName(Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)), 
	Total = convert(float, Sum(ROUND(ICE_Orders.Total, 0))) 
	FROM 
	ICE_Orders 
	WHERE 
	ICE_Orders.Order_Status_ID in (0, 1, 2, 4) and 
	ICE_Orders.Order_Date >= @DateBegin and 
	ICE_Orders.Order_Date <= @DateEnd 

	GROUP BY 
	Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)

	ORDER BY
	Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) 
) as Total
WHERE Maint.Month = Total.Month
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonhlySalesWithMaint]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonhlySalesWithMaint]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_MonhlySalesWithMaint]
	TO [davor.dumeljic]
GO
