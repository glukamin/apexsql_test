SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpChkUserID]
( 
@strUserID VarChar(50) 
) 
 AS 
SELECT tblAuthor.Username, tblAuthor.Author_ID, tblAuthor.Group_ID, tblAuthor.Active, tblAuthor.Signature, tblAuthor.Author_email, tblAuthor.Date_format, tblAuthor.Time_offset, tblAuthor.Time_offset_hours, tblAuthor.Reply_notify, tblAuthor.Attach_signature, tblAuthor.Rich_editor, tblAuthor.Last_visit 
FROM tblAuthor 
WHERE tblAuthor.User_code = @strUserID;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpChkUserID]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpChkUserID]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpChkUserID]
	TO [davor.dumeljic]
GO
