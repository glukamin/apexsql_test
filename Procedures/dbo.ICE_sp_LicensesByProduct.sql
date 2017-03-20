SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[ICE_sp_LicensesByProduct]
(
 @DateBegin datetime ,
 @DateEnd datetime )
AS
SELECT
    dbo.ICE_GetProductAbvName(OD.Product_ID) AS Product ,
    Sum(OD.Qty) AS Count
FROM
ICE_Orders 
INNER JOIN ICE_Order_Details OD ON ICE_Orders.Order_ID = OD.Order_ID 
INNER JOIN ICE_Products P ON OD.Product_ID = P.Product_ID
WHERE
    ICE_Orders.Order_Status_ID IN ( 0 , 1 , 2 , 4 ) 
    AND ICE_Orders.Order_Date >= @DateBegin 
    AND ICE_Orders.Order_Date <= @DateEnd 
    AND NOT OD.Product_ID IN ( 163225 ) 
    AND P.Bundle_Products IS NULL
GROUP BY
    OD.Product_ID
ORDER BY
    dbo.ICE_GetProductAbvName(OD.Product_ID)

GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_LicensesByProduct]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_LicensesByProduct]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_LicensesByProduct]
	TO [davor.dumeljic]
GO
