SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[ICE_sp_ProductLicensesByMonth]
(
 @ProductID int ,
 @DateBegin datetime ,
 @DateEnd datetime )
AS
SELECT
    dbo.ICE_GetMonthName(Month) AS Month ,
    [Order_Count],
    [License_Count]
FROM
    ( SELECT TOP 100 PERCENT
          Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) AS Month ,
          Count(*) AS [Order_Count],
		SUM(ICE_Order_Details.Qty) as [License_Count]  
      FROM
      ICE_Orders INNER JOIN ICE_Order_Details
      ON ICE_Orders.Order_ID = ICE_Order_Details.Order_ID
      WHERE
          ICE_Orders.Order_Status_ID IN ( 0 , 1 , 2 , 4 ) AND ICE_Order_Details.Product_ID = @ProductID AND ICE_Orders.Order_Date >= @DateBegin AND ICE_Orders.Order_Date <= @DateEnd
      GROUP BY
          Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date)
      ORDER BY
          Year(ICE_Orders.Order_Date) * 100 + Month(ICE_Orders.Order_Date) ) T


GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductLicensesByMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductLicensesByMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_ProductLicensesByMonth]
	TO [davor.dumeljic]
GO
