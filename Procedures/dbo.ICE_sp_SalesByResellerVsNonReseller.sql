SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_SalesByResellerVsNonReseller]
(
	@DateBegin datetime, 
	@DateEnd datetime
)
AS

SELECT 
	Type = Case ISNULL(Reseller_ID, 0) 
				when 0 then 
					'Non-Reseller' 
				else 
					'Reseller' 
				End, 
	Total = SUM(Total)

FROM 
	ICE_Orders 

WHERE 
	Order_Status_ID in (0,1,2,4) and 
	Order_Date >= @DateBegin and 
	Order_Date <= @DateEnd 

GROUP BY 
	Case ISNULL(Reseller_ID, 0) 
	when 0 then 
		'Non-Reseller' 
	else 
		'Reseller' 
	End
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByResellerVsNonReseller]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByResellerVsNonReseller]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SalesByResellerVsNonReseller]
	TO [davor.dumeljic]
GO
