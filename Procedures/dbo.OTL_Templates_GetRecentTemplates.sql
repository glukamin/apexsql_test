SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Pankaj Sutradhar
-- Create date: 09/05/2007
-- Description:	Get template details
-- ============================================
CREATE PROCEDURE [dbo].[OTL_Templates_GetRecentTemplates]
AS
BEGIN		
	SELECT TOP 100 
		CONVERT(nvarchar(20),DateUpdated,107) as DateUpdated,
		Id,
		UserId,
		ShortDesc,
		Poster,
		Title,
		OutputLanguage,
		ScriptLanguage,
		ApplicationTypeId, 
		ProjectTypeId, 
		ApplicationName,
		DownloadCount,
		ViewCount,
		DiscussionLink,
		ProjectTypeId
	FROM 
		uv_OTL_TemplateDetails
	WHERE 
		Status=1
	ORDER BY 
		lastmodified DESC
END
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetRecentTemplates]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetRecentTemplates]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetRecentTemplates]
	TO [davor.dumeljic]
GO
