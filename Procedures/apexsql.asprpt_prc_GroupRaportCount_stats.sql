SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [asprpt_prc_GroupRaportCount_stats]
/* ------------------------------------------------------------

   PROCEDURE:    asprpt_prc_stats_GroupRaportCount

   DESCRIPTION:


   ------------------------------------------------------------ */
	AS 
	SELECT GroupName AS 'Group Name', Count(*) AS 'Report Count'
	FROM [asprpt_tbl_Group] INNER JOIN [asprpt_tbl_GroupReport] AS b ON GroupID = b.GroupReportGroupID
	GROUP BY GroupName
	ORDER BY GroupName ASC
	RETURN @@ERROR


GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_GroupRaportCount_stats]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_GroupRaportCount_stats]
	TO [davor.dumeljic]
GO
