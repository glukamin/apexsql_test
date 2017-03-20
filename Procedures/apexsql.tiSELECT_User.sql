SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO

CREATE  Procedure tiSELECT_User
(
		@UserHandle  varchar(75),
		@UserPassword   varchar(50),
		@UserID int Output
/*
06Mar05
Code modified to map tblAuthor
*/
)
As
	SELECT @UserID = (SELECT Author_ID
						FROM tblAuthor
							WHERE Author_email= @UserHandle AND [Password] = @UserPassword)
	--Check for first time log on.
	IF (SELECT Active FROM tblAuthor WHERE  Author_ID = @UserID) = 0
	BEGIN
		UPDATE tblAuthor
		SET Active = 1
		WHERE  Author_ID = @UserID
	END

GO
GRANT EXECUTE
	ON [apexsql].[tiSELECT_User]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[tiSELECT_User]
	TO [davor.dumeljic]
GO
