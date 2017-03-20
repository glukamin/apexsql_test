SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_LeadsByProduct
(
    @StartDate datetime,
    @EndTime datetime
)
AS
BEGIN
SET NOCOUNT ON 
SELECT P.Product_Name, COUNT(*) as Cnt
FROM ICE_SalesLeads S
INNER JOIN ICE_Downloads D on ( S.SalesLeadId = D.Sales_Lead_Id /*and DATEDIFF(HOUR, S.Date_Added, D.Download_Date) < 2*/)
INNER JOIN ICE_Download_Details DD on D.Download_ID = DD.Download_ID
INNER JOIN ICE_Products P on DD.Product_ID = P.Product_ID 
WHERE S.Date_Added between @StartDate and @EndTime
GROUP BY P.Product_Name 
ORDER BY Cnt DESC
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_LeadsByProduct]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_LeadsByProduct]
	TO [davor.dumeljic]
GO
