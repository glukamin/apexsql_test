SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpModerators] 
(
@intForumID int 
)
 AS 
SELECT tblAuthor.Author_ID, tblAuthor.Username 
FROM tblPermissions, tblAuthor 
WHERE tblAuthor.Author_ID = tblPermissions.Author_ID AND tblPermissions.Moderate = 1 AND tblPermissions.Forum_ID = @intForumID;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpModerators]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpModerators]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpModerators]
	TO [davor.dumeljic]
GO
