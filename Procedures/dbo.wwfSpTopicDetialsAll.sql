SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpTopicDetialsAll] 
(
@intForumID int
)
 AS 
SELECT tblTopic.Topic_ID, tblTopic.Moved_ID, tblTopic.No_of_views, tblTopic.Subject, tblTopic.Poll_ID, tblTopic.Locked, tblTopic.Priority FROM tblTopic 
WHERE (tblTopic.Forum_ID = @intForumID) OR  (tblTopic.Priority = 3) OR (tblTopic.Moved_ID = @intForumID) 
ORDER BY tblTopic.Priority DESC, tblTopic.Last_entry_date DESC;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpTopicDetialsAll]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpTopicDetialsAll]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpTopicDetialsAll]
	TO [davor.dumeljic]
GO
