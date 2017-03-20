SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:	Pankaj Sutradhar
-- Create date: 08/21/2007
-- Description:	Delete template by Id
-- ============================================
CREATE PROCEDURE [dbo].[OTL_Templates_DeleteByTemplateId]
@Id int
AS
	BEGIN TRANSACTION
	BEGIN

	DELETE FROM OTL_Templates WHERE Id=@Id

	END
	IF @@ERROR > 0 
		BEGIN
			ROLLBACK TRANSACTION
			RETURN(-1)
		END
	ELSE
		BEGIN
			COMMIT TRANSACTION
			RETURN(0)
		END
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_DeleteByTemplateId]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_DeleteByTemplateId]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_Templates_DeleteByTemplateId]
	TO [davor.dumeljic]
GO
