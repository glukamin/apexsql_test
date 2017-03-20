SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [apexsql].[ICE_sp_SalesByMaintvsSalesWithNoMaint]
(
	@DateBegin datetime,
    @DateEnd datetime
)	

AS

DECLARE @SalesWithMaint float
DECLARE @TotalSales float
DECLARE @SalesWithNoMaint float

SET @SalesWithMaint = 
					(
						SELECT Top 100 percent 					
						MaintSales = convert(float, Sum(ROUND(ICE_Orders.Total, 0))) 
						FROM ICE_Orders 
						INNER JOIN ICE_Extension_Details on ICE_Orders.Order_ID = ICE_Extension_Details.Order_ID 
						WHERE 
						ICE_Orders.Order_Status_ID in (0, 1, 2, 4) and 
						ICE_Orders.Order_Date >= @DateBegin and 
						ICE_Orders.Order_Date <= @DateEnd 
					)

SET @TotalSales = 
					( 
						SELECT Top 100 percent 		
						SalesNoMaint = convert(float, Sum(ROUND(Total, 0))) 
						FROM 
						ICE_Orders 
						WHERE
						Order_Status_ID in (0, 1, 2, 4) AND
						Order_Date >= @DateBegin AND
						Order_Date <= @DateEnd 
					)

SET @SalesWithNoMaint = @TotalSales - @SalesWithMaint

SELECT @SalesWithMaint AS Total, 'Sales with maint' AS Description 
UNION ALL
SELECT @SalesWithNoMaint AS Total, 'Sales with no maint' AS Description 
GO
GRANT EXECUTE
	ON [apexsql].[ICE_sp_SalesByMaintvsSalesWithNoMaint]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[ICE_sp_SalesByMaintvsSalesWithNoMaint]
	TO [davor.dumeljic]
GO
