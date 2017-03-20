SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE  Procedure tiSELECT_ByUserEmail
(
		@UserEmail  varchar(75)
)
/*
06Mar05
Code modified to map tblAuthor
*/
As
	SELECT Author_email as UserHandle,[Password] as  UserPassword
	FROM tblAuthor
	WHERE Author_email = @UserEmail

GO
GRANT EXECUTE
	ON [apexsql].[tiSELECT_ByUserEmail]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[tiSELECT_ByUserEmail]
	TO [davor.dumeljic]
GO
