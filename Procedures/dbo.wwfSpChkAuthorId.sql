SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[wwfSpChkAuthorId]
( 
@AuthorId int
) 
 AS 
SELECT tblauthor.User_code, tblAuthor.Group_ID, tblAuthor.Author_ID 
FROM tblAuthor 
WHERE tblAuthor.Author_ID = @AuthorId;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpChkAuthorId]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpChkAuthorId]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpChkAuthorId]
	TO [davor.dumeljic]
GO
