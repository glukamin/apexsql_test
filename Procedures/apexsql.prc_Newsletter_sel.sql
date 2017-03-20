SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE prc_Newsletter_sel
(
@UserEmail varchar(50)
)
As

	DECLARE @Err Int
	DECLARE @Flag Int
	Select [UserEmail],Createdon,Status FROM [Newsletter] WHERE [UserEmail]= @UserEmail
	
	Set @Err = @@Error

	RETURN @Err
GO
GRANT EXECUTE
	ON [apexsql].[prc_Newsletter_sel]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_Newsletter_sel]
	TO [davor.dumeljic]
GO
