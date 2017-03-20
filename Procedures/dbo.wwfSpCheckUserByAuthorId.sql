SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE  PROCEDURE [dbo].[wwfSpCheckUserByAuthorId]
( 
	@AuthorId int
) 
 AS 
	SELECT 
		tblAuthor.Username, tblAuthor.Author_ID, tblAuthor.Group_ID,
		tblAuthor.Active, tblAuthor.Signature, tblAuthor.Author_email, 
		tblAuthor.Date_format, tblAuthor.Time_offset, 
		tblAuthor.Time_offset_hours, tblAuthor.Reply_notify, 
		tblAuthor.Attach_signature, tblAuthor.Rich_editor, tblAuthor.Last_visit 
	FROM 
		tblAuthor 
	WHERE 
		tblAuthor.Author_ID = @AuthorId


GO
GRANT EXECUTE
	ON [dbo].[wwfSpCheckUserByAuthorId]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpCheckUserByAuthorId]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpCheckUserByAuthorId]
	TO [davor.dumeljic]
GO
