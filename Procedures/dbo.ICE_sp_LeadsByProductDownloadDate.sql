SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_LeadsByProductDownloadDate
( 
@StartDate datetime, 
@EndTime datetime 
) 
AS 
BEGIN 
SET NOCOUNT ON 
SELECT P.Product_Name, COUNT(*) as Cnt 
FROM ICE_SalesLeads S 
INNER JOIN ICE_Downloads D on (S.SalesLeadId = D.Sales_Lead_Id) 
INNER JOIN ICE_Download_Details DD on D.Download_ID = DD.Download_ID 
INNER JOIN ICE_Products P on DD.Product_ID = P.Product_ID 
WHERE S.Date_Added between @StartDate and @EndTime  and D.Download_Date between  @StartDate and @EndTime
GROUP BY P.Product_Name 
ORDER BY Cnt DESC 
END
GO
