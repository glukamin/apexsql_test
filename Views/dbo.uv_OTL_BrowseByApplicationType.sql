SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Pankaj Sutradhar
-- Create date: 09/04/2007
-- Description:	Get ApplicationTypes Details
-- =============================================

CREATE VIEW dbo.uv_OTL_BrowseByApplicationType
AS
	SELECT     dbo.OTL_Templates.ApplicationTypeId,
		     dbo.OTL_ApplicationTypes.Name + ' (' + CAST(dbo.OTL_getapprovedtemplatecount(dbo.OTL_Templates.ApplicationTypeId,'A') AS nvarchar(50)) + ')' AS ApplicationTypeName

	FROM        dbo.OTL_ApplicationTypes LEFT OUTER JOIN
	                  dbo.OTL_Templates ON dbo.OTL_ApplicationTypes.Id = dbo.OTL_Templates.ApplicationTypeId

	GROUP BY dbo.OTL_Templates.ApplicationTypeId, dbo.OTL_ApplicationTypes.Name






GO
