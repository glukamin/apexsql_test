SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpForumThreadCount] 
(
@intForumID int
)
 AS 
SELECT Count(tblThread.Thread_ID) AS Thread_Count 
FROM tblTopic INNER JOIN tblThread ON tblTopic.Topic_ID = tblThread.Topic_ID 
GROUP BY tblTopic.Forum_ID 
HAVING (((tblTopic.Forum_ID)=@intForumID));
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumThreadCount]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumThreadCount]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumThreadCount]
	TO [davor.dumeljic]
GO
