SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_TopResellerSales]
(
	@DateBegin datetime, 
	@DateEnd datetime
)
as

SELECT 
	Reseller = (
	SELECT 
		Company + ' - ' + First_Name + ' ' + Last_Name + ' - ' + CONVERT(varchar(20), Discount) + '%' 
	
	FROM 
		ICE_Resellers 
	
	WHERE 
		ICE_Resellers.Reseller_ID = T.Reseller_ID
	), 
	
	T.Total 
	
FROM 
(
	SELECT Top 100 percent 
		Reseller_ID, 
		Total = CONVERT(FLOAT, SUM(Total)) 
	
	FROM 
		ICE_Orders 
	
	WHERE 
		Order_Status_ID in (0,1,2,4) AND 
		Order_Date >= @DateBegin AND 
		Order_Date <= @DateEnd AND 
		ISNULL(Reseller_ID, 0) > 0 
	
	GROUP BY 
		Reseller_ID
) AS T 

order by T.Total Desc
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TopResellerSales]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TopResellerSales]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TopResellerSales]
	TO [davor.dumeljic]
GO
