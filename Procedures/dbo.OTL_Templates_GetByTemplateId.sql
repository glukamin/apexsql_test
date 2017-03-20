SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Pankaj Sutradhar
-- Create date: 08/21/2007
-- Description:	Get all fields from template table by given id.
-- ============================================
CREATE PROCEDURE [dbo].[OTL_Templates_GetByTemplateId]
@Id int
AS
BEGIN
	SET NOCOUNT ON

	SELECT 
		* 
	FROM 
		uv_OTL_TemplateDetails 
	WHERE 
		Id = @Id 
END
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetByTemplateId]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetByTemplateId]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetByTemplateId]
	TO [davor.dumeljic]
GO
