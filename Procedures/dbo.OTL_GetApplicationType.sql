SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO


-- =============================================
-- Author:	Pankaj Sutradhar
-- Create date: 09/04/2007
-- Description:	Get applicationtype
-- =============================================
CREATE PROCEDURE [dbo].[OTL_GetApplicationType]
 AS
	BEGIN
		SELECT * FROM uv_OTL_BrowseByApplicationType
	END
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetApplicationType]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetApplicationType]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_GetApplicationType]
	TO [davor.dumeljic]
GO
