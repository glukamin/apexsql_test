SET ANSI_NULLS OFF
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:-    Pankaj Sutradhar
-- Create date: 09/11/2007
-- Description:	Updates the status field to 1
-- =============================================
CREATE PROCEDURE [dbo].[OTL_ApproveTemplate] 
(
@Id int
)
AS

BEGIN 

BEGIN TRANSACTION
	UPDATE OTL_Templates SET Status=1 WHERE Id=@Id
	SELECT Status FROM OTL_Templates  WHERE Id=@Id

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
END
GO
GRANT EXECUTE
	ON [dbo].[OTL_ApproveTemplate]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[OTL_ApproveTemplate]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[OTL_ApproveTemplate]
	TO [davor.dumeljic]
GO
