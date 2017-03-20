SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ICE_sp_ResellerSalesByMonth]
(
	@DateBegin datetime, 
	@DateEnd datetime, 
	@Reseller_ID int
)
AS

SELECT 
	Month = dbo.ICE_GetMonthName(T.Month), 
	Total = T.Total 

FROM 
(
	SELECT Top 100 percent 
		Month = YEAR(Order_Date) * 100 + Month(Order_Date), 
		Total = CONVERT(float, Sum(Total))
		
	FROM 
		ICE_Orders 
	
	WHERE 
		Order_Status_ID in (0,1,2,4) AND 
		Order_Date >= @DateBegin AND 
		Order_Date <= @DateEnd AND 
		Reseller_ID = @Reseller_ID 
	
	GROUP BY 
		YEAR(Order_Date) * 100 + Month(Order_Date) 
		
	ORDER BY 
		YEAR(Order_Date) * 100 + Month(Order_Date)
		
) AS T


GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ResellerSalesByMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ResellerSalesByMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ResellerSalesByMonth]
	TO [davor.dumeljic]
GO
