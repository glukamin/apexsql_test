SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO


-- =============================================
-- Author:	Pankaj Sutradhar
-- Create date:09/ 04/2007
-- Description:	get top 4 users
-- =============================================
CREATE PROCEDURE [dbo].[OTL_GetTopUsers]
 AS
	BEGIN
		SELECT TOP 4* FROM uv_OTL_BrowseByMember
	END
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetTopUsers]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetTopUsers]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetTopUsers]
	TO [davor.dumeljic]
GO
