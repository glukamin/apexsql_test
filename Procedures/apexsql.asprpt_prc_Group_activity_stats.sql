SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [asprpt_prc_Group_activity_stats]

/* ------------------------------------------------------------

   PROCEDURE:    asprpt_prc_Group_activity_stats

   DESCRIPTION:  

   ------------------------------------------------------------ */

	AS
	SELECT GroupName AS 'Group Name', Count(StatsReportID) AS 'Report Count'
	FROM [asprpt_tbl_Group] INNER JOIN [asprpt_tbl_Stats] AS b ON GroupID = b.StatsGroupID
	GROUP BY GroupName
	ORDER BY GroupName ASC
	RETURN @@ERROR



GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_Group_activity_stats]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_Group_activity_stats]
	TO [davor.dumeljic]
GO
