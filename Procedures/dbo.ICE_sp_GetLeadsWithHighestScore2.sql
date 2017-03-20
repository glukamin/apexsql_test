SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_GetLeadsWithHighestScore2]
(
    @LastActivityFrom datetime,
    @LastActivityTo datetime
)
AS
BEGIN
SELECT TOP 30 S.Author_ID, S.Email, S.First_Name, S.Last_Name, SUM(dbo.ICE_GetWebPageScore(P.Short_URL)) as LeadScore
FROM ICE_Web_Visitors W WITH(NOLOCK)
INNER JOIN ICE_SalesLeads S WITH(NOLOCK) on W.RegisterID = S.Author_ID
INNER JOIN ICE_Page_Visits P WITH(NOLOCK) on W.Web_Visitor_ID = P.TrackingID
WHERE
W.Web_Visitor_ID in (SELECT DISTINCT TrackingID FROM ICE_Page_Visits WHERE P.VisitTime between @LastActivityFrom and @LastActivityTo)
and Email not like '%apexsql%'
GROUP BY S.Email, S.First_Name, S.Last_Name, S.Author_ID
ORDER BY LeadScore desc
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetLeadsWithHighestScore2]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetLeadsWithHighestScore2]
	TO [davor.dumeljic]
GO
