SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Search_Customers_By_Period_SEO]
(
      @StartDate datetime,
      @EndDate datetime
)
AS
BEGIN

SELECT ic.Cust_ID,
      ic.Email
  FROM dbo.ICE_Customers ic
  INNER JOIN(
  SELECT Q.Cust_ID, Q.Order_Date, Q.Order_ID
  from dbo.ICE_Orders Q
  WHERE Q.Order_Status_ID IN (0,1,2,3,4)
  AND  Q.Order_Date >= @StartDate
  AND Q.Order_Date <= @EndDate
  )o ON o.Cust_ID = ic.Cust_ID
  GROUP BY ic.Cust_ID, ic.Email
  
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_Customers_By_Period_SEO]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Search_Customers_By_Period_SEO]
	TO [davor.dumeljic]
GO
