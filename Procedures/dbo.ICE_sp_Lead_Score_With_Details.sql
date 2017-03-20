SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Lead_Score_With_Details]
(
      @StartDate datetime,
      @EndDate datetime 
)
AS
BEGIN

SELECT a.SalesLeadId, b.Email, b.Date_Added, a.WebScore, a.VisitScore, b.countryScore, b.EmailScore, b.MCScore, b.ProductScore, (a.WebScore+a.VisitScore+a.VisitScore+b.countryScore+b.EmailScore+b.MCScore+b.ProductScore) AS total
FROM (
SELECT isl.SalesLeadId,
 isnull(SUM(ISNULL(ips.Score, 1)), 0) AS WebScore,
    isnull(COUNT(distinct CONVERT(date, VisitTime))*5, 0) AS VisitScore
FROM dbo.ICE_SalesLeads isl WITH(NOLOCK)
LEFT JOIN dbo.ICE_Web_Visitors iwv WITH(NOLOCK) ON iwv.RegisterID = isl.Author_ID
LEFT JOIN dbo.ICE_Page_Visits ipv WITH(NOLOCK) ON ipv.TrackingID = iwv.Web_Visitor_ID
FULL JOIN dbo.ICE_Page_Score ips ON ipv.Short_URL = ips.Page
WHERE isl.Date_Added BETWEEN @StartDate AND @EndDate
GROUP BY isl.SalesLeadId) AS a
JOIN (SELECT isl.SalesLeadId,isl.Email, isl.Date_Added,
isnull((case isl.Country
	   WHEN 'USA' THEN 20	
	   WHEN 'UNITED STATES' THEN 20	
	   ELSE 0 END),0) as countryScore,
	   isnull((case isl.First_Downloaded_Product_ID
	   when 183236 /* Log */ then 6
	   when 300100681 /* Recover */ then 5
	   when 141573 /* Audit */ then 4
	   when 167831 /* Diff */ then 4
	   when 204978 /* Univ Studio */ then 4
	   when 300267612 /* Data Diff */ then 3
	   when 202696 /* Doc */ then 3
	   else 0
	   end ),0) AS ProductScore,
	   isnull((case dbo.IsFreeEmail(SUBSTRING(isl.Email,CHARINDEX('@',isl.Email,1) + 1 ,LEN(isl.Email) - CHARINDEX('@',isl.Email,1) + 1))
	   WHEN 0 THEN 20
	   ELSE 0
	   END),0) AS EmailScore,
	   dbo.ICE_LeadEmailActivityScore3(isl.SalesLeadId) AS MCScore
	   FROM dbo.ICE_SalesLeads isl WITH(NOLOCK)
WHERE isl.Date_Added BETWEEN @StartDate AND @EndDate) as b ON a.SalesLeadId = b.SalesLeadId
   


END

GO
