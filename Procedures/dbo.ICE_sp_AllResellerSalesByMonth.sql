SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_AllResellerSalesByMonth]
(
	@DateBegin datetime, 
	@DateEnd datetime
)
AS

SELECT 
	Month = dbo.ICE_GetMonthName(T.Month), 
	Total = T.Total 
FROM 
(
	SELECT TOP 100 PERCENT
		Month = YEAR(Order_Date) * 100 + Month(Order_Date), 
		Total = CONVERT(float, Sum(Total))
		
	FROM 
		ICE_Orders 
		
	WHERE 
		Order_Status_ID in (0,1,2,4) AND 
		Order_Date >=@DateBegin AND 
		Order_Date<=@DateEnd AND 
		ISNULL(Reseller_ID, 0) > 0 
	
	GROUP BY 
		YEAR(Order_Date) * 100 + Month(Order_Date) 
	
	ORDER BY 
		YEAR(Order_Date) * 100 + Month(Order_Date)
) T
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_AllResellerSalesByMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_AllResellerSalesByMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_AllResellerSalesByMonth]
	TO [davor.dumeljic]
GO
