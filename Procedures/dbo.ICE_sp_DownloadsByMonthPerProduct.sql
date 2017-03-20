SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_DownloadsByMonthPerProduct]
(
		@ProductID int ,
		@DateBegin datetime ,
		@DateEnd datetime
)
AS
BEGIN 

WITH summary AS (
    SELECT p.Download_Date, 
           p.Sales_Lead_Id, 
           p.Product_ID, 
           ROW_NUMBER() OVER(PARTITION BY p.Sales_Lead_Id 
                                 ORDER BY p.Download_Date DESC) AS rk
      FROM (SELECT
id.Download_Date,
id.Sales_Lead_Id,
idd.Product_ID
FROM dbo.ICE_Downloads id
INNER JOIN dbo.ICE_Download_Details idd ON idd.Download_ID = id.Download_ID
INNER JOIN dbo.ICE_SalesLeads isl ON isl.SalesLeadId = id.Sales_Lead_Id
WHERE idd.Product_ID = @ProductID AND id.Download_Date BETWEEN @DateBegin AND @DateEnd) p)
SELECT Year(s.Download_Date) * 100 + Month(s.Download_Date) AS Month,
Count(*) AS [Order_Count]
  FROM summary s
 WHERE s.rk = 1
GROUP BY
          Year(s.Download_Date) * 100 + Month(s.Download_Date)
      ORDER BY
          Year(s.Download_Date) * 100 + Month(s.Download_Date)


END
GO
