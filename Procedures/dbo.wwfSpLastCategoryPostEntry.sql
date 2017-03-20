SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[wwfSpLastCategoryPostEntry] 
(
	@Category_ID int
)
 AS 
SELECT Top 1 tblAuthor.Username, tblAuthor.Author_ID, tblThread.Topic_ID, tblThread.Thread_ID, tblThread.Message_date 
FROM tblAuthor, tblThread  
WHERE tblAuthor.Author_ID = tblThread.Author_ID AND tblThread.Topic_ID IN 
     (SELECT TOP 1 tblTopic.Topic_ID 
     FROM tblTopic 
     JOIN tblForum on tblTopic.Forum_ID = tblForum.Forum_ID
     WHERE tblForum.Cat_ID = @Category_ID
     ORDER BY tblTopic.Last_entry_date DESC) 
ORDER BY tblThread.Message_date DESC;

GO
GRANT EXECUTE
	ON [dbo].[wwfSpLastCategoryPostEntry]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpLastCategoryPostEntry]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpLastCategoryPostEntry]
	TO [davor.dumeljic]
GO
