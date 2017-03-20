SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Search_Direct_Customers_From_Orders_SEO]
( 
@StartDate datetime, 
@EndDate datetime
) 
AS 
BEGIN 
SELECT O.Order_ID, O.Cust_ID, O.Email_Ship, O.Total, O.Country_Ship, O.Order_Date
  FROM dbo.ICE_Orders O
  WHERE O.Order_Type_ID = 1 
  AND O.Order_Status_ID in (0,1,2,4)
  AND o.Reseller_ID IS NULL
  AND O.Order_Date >= @StartDate
  AND O.Order_Date <= @EndDate
  ORDER BY O.Order_Date
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_Direct_Customers_From_Orders_SEO]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_Direct_Customers_From_Orders_SEO]
	TO [davor.dumeljic]
GO
