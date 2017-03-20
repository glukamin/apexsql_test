SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE  Procedure tiSELECT_UserLevel
(
		@UserID integer,
		@UserLevel integer Output
/*
06Mar05
Code modified to map tblAuthor
*/
)
As
	SELECT @UserLevel = (SELECT Group_ID as UserLevel
							FROM tblAuthor
								WHERE Author_ID= @UserID)

GO
GRANT EXECUTE
	ON [apexsql].[tiSELECT_UserLevel]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[tiSELECT_UserLevel]
	TO [davor.dumeljic]
GO
