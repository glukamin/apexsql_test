SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE prc_Newsletter_del
(
@UserEmail varchar(50)
)
As
BEGIN
	DECLARE @Err Int

	DELETE
	FROM [Newsletter]
	WHERE [UserEmail] = @UserEmail

	Set @Err = @@Error

	RETURN @Err
End
GO
GRANT EXECUTE
	ON [apexsql].[prc_Newsletter_del]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_Newsletter_del]
	TO [davor.dumeljic]
GO
