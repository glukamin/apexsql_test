SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Leads_By_Month_Free_To_NoFree] 
( 
@Product_ID int,
@jump int,
@StartDate datetime, 
@EndDate datetime 
) 
AS 
BEGIN 
IF @jump > 0
BEGIN
SELECT 
YEAR(P.Date_Added)*100 + '-' + MONTH(P.Date_Added) as [Month], 
COUNT(*) as LeadCount 
from 
( 
SELECT DISTINCT S.SalesLeadId, S.Date_Added 
FROM ICE_SalesLeads S 
INNER JOIN ICE_Downloads D on S.SalesLeadId = D.Sales_Lead_Id 
WHERE s.First_Downloaded_Product_ID IN (300544515, 300467396, 300172712)
AND d.Download_ID IN (SELECT DISTINCT Download_ID FROM dbo.ICE_Download_Details idd WHERE idd.Product_ID = @Product_ID)
AND  S.Date_Added BETWEEN @StartDate AND @EndDate 
) P 
GROUP BY YEAR(P.Date_Added)*100 + '-' + MONTH(P.Date_Added) 
ORDER BY [Month] 
END
ELSE
BEGIN
SELECT 
YEAR(P.Date_Added)*100 + '-' + MONTH(P.Date_Added) as [Month], 
COUNT(*) as LeadCount 
from 
( 
SELECT DISTINCT S.SalesLeadId, S.Date_Added 
FROM ICE_SalesLeads S 
INNER JOIN ICE_Downloads D on S.SalesLeadId = D.Sales_Lead_Id 
WHERE s.First_Downloaded_Product_ID IN (300544515, 300467396, 300172712)
AND d.Download_ID IN (SELECT DISTINCT Download_ID FROM dbo.ICE_Download_Details idd WHERE idd.Product_ID NOT IN (300544515, 300467396, 300172712))
AND  S.Date_Added BETWEEN @StartDate AND @EndDate 
) P 
GROUP BY YEAR(P.Date_Added)*100 + '-' + MONTH(P.Date_Added) 
ORDER BY [Month] 
END
END
GO
