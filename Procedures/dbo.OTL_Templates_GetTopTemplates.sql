SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author: Pankaj Sutradhar
-- Create date: 09/04/2007
-- Description:	Get most downloaded or most viewed templates
-- ============================================
CREATE PROCEDURE [dbo].[OTL_Templates_GetTopTemplates]
@CountType nvarchar(2)
AS
	BEGIN
		IF @CountType='D'  --to get most downloaded templates
		BEGIN
			SELECT TOP 4 Id,Title+ ' ('+CAST(Downloadcount as nvarchar(50))+ ')' as Title ,UserId
			FROM uv_OTL_TemplateDetails
			WHERE Status=1
		             ORDER BY DownloadCount DESC
		END

		IF @CountType='V'	--to get most downloaded templates
		BEGIN
			SELECT TOP 15 Id,Title+ ' ('+CAST(Downloadcount as nvarchar(50))+ ')' as Title,UserId
			FROM uv_OTL_TemplateDetails
			WHERE Status=1
		             ORDER BY Downloadcount DESC
		END
	
	END
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetTopTemplates]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetTopTemplates]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetTopTemplates]
	TO [davor.dumeljic]
GO
