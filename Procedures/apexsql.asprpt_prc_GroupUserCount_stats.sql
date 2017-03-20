SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO




CREATE PROCEDURE [asprpt_prc_GroupUserCount_stats]
/* ------------------------------------------------------------

   PROCEDURE:    asprpt_prc_stats_GroupUserCount

   DESCRIPTION:

   ------------------------------------------------------------ */
	AS 
	SELECT GroupName AS 'Group Name', Count(*) AS 'User Count'
	FROM [asprpt_tbl_Group] INNER JOIN [asprpt_tbl_UserGroup] AS b ON GroupID = b.UserGroupGroupID
	GROUP BY GroupName
	ORDER BY GroupName ASC
	RETURN @@ERROR


GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_GroupUserCount_stats]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[asprpt_prc_GroupUserCount_stats]
	TO [davor.dumeljic]
GO
