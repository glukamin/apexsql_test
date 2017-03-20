SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE prc_upd_Usercode
(
@UserEmail nvarchar(75),
@UserCode nvarchar(50)
)
As
/*
06Mar05
New sp to update Usercode for tblAuthor
*/
UPDATE tblAuthor SET User_code = @UserCode
WHERE Author_email = @UserEmail

GO
GRANT EXECUTE
	ON [apexsql].[prc_upd_Usercode]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [apexsql].[prc_upd_Usercode]
	TO [davor.dumeljic]
GO
