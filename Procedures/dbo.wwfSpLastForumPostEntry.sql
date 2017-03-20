SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpLastForumPostEntry] 
(
@intForumID int
)
 AS 
SELECT Top 1 tblAuthor.Username, tblAuthor.Author_ID, tblThread.Topic_ID, tblThread.Thread_ID, tblThread.Message_date 
FROM tblAuthor, tblThread  
WHERE tblAuthor.Author_ID = tblThread.Author_ID AND tblThread.Topic_ID IN 
     (SELECT TOP 1 tblTopic.Topic_ID 
     FROM tblTopic 
     WHERE tblTopic.Forum_ID = @intForumID 
     ORDER BY tblTopic.Last_entry_date DESC) 
ORDER BY tblThread.Message_date DESC;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpLastForumPostEntry]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpLastForumPostEntry]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpLastForumPostEntry]
	TO [davor.dumeljic]
GO
