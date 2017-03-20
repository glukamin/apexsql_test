SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Pankaj Sutradhar
-- Create date: 08/21/2007
-- Description:	Get all Templates by given user id.
-- ============================================
CREATE PROCEDURE [dbo].[OTL_Templates_GetByUserId]
(
	@UserId int,
	@Title nvarchar(50) OUTPUT,
	@ScriptLanguage nvarchar(50) OUTPUT,
	@DateLoaded datetime OUTPUT, 
    @Status bit OUTPUT
)
AS
	SET NOCOUNT ON
	
	SELECT
		@Title=Title,
		@ScriptLanguage=ScriptLanguage,
		@DateLoaded=DateLoaded,
		@Status=Status
	FROM
		OTL_Templates
	WHERE
		UserId = @UserId		
	RETURN
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetByUserId]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetByUserId]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_GetByUserId]
	TO [davor.dumeljic]
GO
