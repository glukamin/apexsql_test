SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LeadsForScoreUpdate]
(
    @StartRange int,
    @EndRange int,
    @LastVisitDays int,
    @LastUpdatedHours int
)
AS
BEGIN

DECLARE @DateFrom datetime
DECLARE @DateTo datetime

SET @DateFrom = DATEADD(DAY, @StartRange, GETDATE())
SET @DateTo = DATEADD(DAY, @EndRange, GETDATE())

SELECT
    SL.SalesLeadId, 
    SL.CRM_ID,    
    SL.Email_Activity_Score,
	SL.Web_Score,
    SL.Last_Score_Update,
	Z.Visits_Score + P.Activity_Score as [New_Web_Score],
	ISNULL(Zoki.New_Email_Score, 0) as [New_Email_Score]
FROM ICE_SalesLeads SL WITH(NOLOCK)
INNER JOIN 
(
	-- This sub query creates new web visists score (counts number of website visits)
	SELECT P.SalesLeadId, (COUNT(*) - 1) * 5 as [Visits_Score]
	FROM	
	(
		SELECT SL.SalesLeadId, CONVERT(date, VisitTime) as [DT]
		FROM ICE_Page_Visits PV WITH(NOLOCK)
		INNER JOIN ICE_Web_Visitors WV WITH(NOLOCK) on PV.TrackingID = WV.Web_Visitor_ID
		INNER JOIN ICE_SalesLeads SL WITH(NOLOCK) on Wv.RegisterID = SL.Author_ID
		WHERE PV.VisitTime BETWEEN @DateFrom and @DateTo
		AND SL.CRM_ID is not null
		AND (ISNULL(SL.Last_Score_Update, '01/01/2013')) < DATEADD(HOUR, @LastUpdatedHours, GETDATE())
		GROUP BY SL.SalesLeadId, CONVERT(date, VisitTime)
	) P
	GROUP BY P.SalesLeadId
) Z on SL.SalesLeadId = Z.SalesLeadId
INNER JOIN 
(
	-- This sub query creates new web activity score (sum of all pages that were visited)
	SELECT S.SalesLeadId, SUM(ISNULL(PS.Score, 1)) as Activity_Score
	FROM ICE_Page_Visits PV WITH(NOLOCK)
	INNER JOIN ICE_Web_Visitors WV WITH(NOLOCK) on PV.TrackingID = WV.Web_Visitor_ID
	INNER JOIN ICE_SalesLeads S WITH(NOLOCK) on Wv.RegisterID = S.Author_ID
	FULL JOIN ICE_Page_Score PS WITH(NOLOCK) on PV.Short_URL = PS.Page
	WHERE PV.VisitTime between @DateFrom and @DateTo
	AND CRM_ID is not null
	AND (ISNULL(S.Last_Score_Update, '01/01/2013')) < DATEADD(HOUR, @LastUpdatedHours, GETDATE())
	GROUP BY S.SalesLeadId
) P ON SL.SalesLeadId = P.SalesLeadId
FULL JOIN
(
	--This sub query creates new email activity score
	SELECT Y.SalesLeadId, SUM(Y.Action_Point) as New_Email_Score
	FROM
	(
		SELECT S.SalesLeadId,
		(CASE [Action]
			WHEN 'open' THEN 5
			ELSE 7
		END) AS [Action_Point]
		from ICE_MC_Lead_Activities MCA WITH(NOLOCK)
		INNER JOIN ICE_SalesLeads S WITH(NOLOCK) on MCA.Lead_ID = S.SalesLeadId
		WHERE Action_Date between @DateFrom and @DateTo
		and S.CRM_ID is not null
		AND (ISNULL(S.Last_Score_Update, '01/01/2013')) < DATEADD(HOUR, @LastUpdatedHours, GETDATE())
		--this part makes it that only one actioin for every 3 hours is taken into account
		group by S.SalesLeadId, CONVERT(datetime, CONVERT(varchar(20), CONVERT(date, Action_Date))+ ' ' + CONVERT(varchar(20), DATEPART(HOUR, Action_Date)/3*3) + ':00:00'), [Action], Campaign
	) Y
	GROUP BY Y.SalesLeadId
) Zoki on SL.SalesLeadId = Zoki.New_Email_Score
WHERE (ISNULL(SL.Web_Score,0) != P.Activity_Score + Z.Visits_Score OR ISNULL(SL.Email_Activity_Score,0) != Zoki.New_Email_Score)
and Sl.SalesLeadId is not null


/*

SELECT P.SalesLeadId,
    P.CRM_ID,
    P.Email_Activity_Score,
    P.Web_Score,
    P.Last_Score_Update,        
    dbo.ICE_LeadWebActivityScore(P.SalesLeadId, @ScoreStart, @ScoreEnd) + dbo.ICE_LeadWebVisitsScore(P.SalesLeadId,@ScoreStart, @ScoreEnd) as New_Web_Score,
    dbo.ICE_LeadEmailActivityScore(P.SalesLeadId, @ScoreStart, @ScoreEnd) as New_Email_Score 
FROM 
(
    SELECT distinct top 100
    S.SalesLeadId, 
    S.CRM_ID,
    S.Web_Score,
    S.Email_Activity_Score,
    S.Last_Score_Update
    FROM ICE_Page_Visits PV
    INNER JOIN ICE_Web_Visitors WV on PV.TrackingID = WV.Web_Visitor_ID
    INNER JOIN ICE_SalesLeads S on WV.RegisterID = S.Author_ID
    WHERE 
    (
	   (PV.VisitTime BETWEEN DATEADD(DAY, @StartRange, GETDATE()) AND DATEADD(DAY, @EndRange, GETDATE()))
	   OR
	   (PV.VisitTime BETWEEN DATEADD(DAY, @LastVisitDays, GETDATE()) AND GETDATE())
    )
    AND S.Last_Score_Update < DATEADD(HOUR, @LastUpdatedHours, GETDATE())
    AND CRM_ID is not null
    AND 
    (
	   dbo.ICE_LeadWebActivityScore(S.SalesLeadId,@ScoreStart, @ScoreEnd) + dbo.ICE_LeadWebVisitsScore(S.SalesLeadId,@ScoreStart, @ScoreEnd) != S.Web_Score	   
    )

    UNION

    SELECT DISTINCT TOP 100
    S.SalesLeadId, 
    S.CRM_ID,
    S.Web_Score,
    S.Email_Activity_Score,
    S.Last_Score_Update
    FROM ICE_MC_Lead_Activities MCLA
    INNER JOIN ICE_SalesLeads S on MCLA.Lead_ID = S.SalesLeadId
    WHERE
    (
	   (MCLA.Action_Date BETWEEN DATEADD(DAY, @StartRange, GETDATE()) AND DATEADD(DAY, @EndRange, GETDATE()))
	   OR
	   (MCLA.Action_Date BETWEEN DATEADD(DAY, @LastVisitDays, GETDATE()) AND GETDATE())
    )
    AND S.Last_Score_Update < DATEADD(HOUR, @LastUpdatedHours, GETDATE())
    AND CRM_ID is not null
    AND 
    (	   
	   dbo.ICE_LeadEmailActivityScore(S.SalesLeadId, @ScoreStart, @ScoreEnd) != S.Email_Activity_Score
    )
) AS P
*/

END
GO
GRANT EXECUTE
	ON [dbo].[LeadsForScoreUpdate]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[LeadsForScoreUpdate]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[LeadsForScoreUpdate]
	TO [davor.dumeljic]
GO
