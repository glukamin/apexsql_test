SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpForumEmailNotify] 
(
@lngAuthorID int, 
@intForumID int 
)
 AS 
SELECT tblEmailNotify.* 
FROM tblEmailNotify 
WHERE tblEmailNotify.Author_ID = @lngAuthorID AND tblEmailNotify.Forum_ID = @intForumID;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumEmailNotify]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumEmailNotify]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumEmailNotify]
	TO [davor.dumeljic]
GO
