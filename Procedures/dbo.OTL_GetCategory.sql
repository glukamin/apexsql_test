SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO


-- =============================================
-- Author:	Pankaj Sutradhar
-- Create date: 09/03/2007
-- Description:	Get category
-- =============================================
CREATE PROCEDURE [dbo].[OTL_GetCategory]
 AS
	BEGIN
		SELECT * FROM uv_OTL_BrowseByCategories
	END
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetCategory]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetCategory]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetCategory]
	TO [davor.dumeljic]
GO
