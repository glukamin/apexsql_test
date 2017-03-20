SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpForumTopicCount] 
(
@intForumID int
)
 AS 
SELECT Count(tblTopic.Forum_ID) AS Topic_Count From tblTopic WHERE tblTopic.Forum_ID = @intForumID
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumTopicCount]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumTopicCount]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumTopicCount]
	TO [davor.dumeljic]
GO
