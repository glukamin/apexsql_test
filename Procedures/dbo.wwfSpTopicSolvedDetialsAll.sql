SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[wwfSpTopicSolvedDetialsAll] 
(
@intForumID int
)
 AS 
SELECT tblTopic.Topic_ID, tblTopic.Moved_ID, tblTopic.No_of_views, tblTopic.Subject, tblTopic.Poll_ID, tblTopic.Locked, tblTopic.Priority FROM tblTopic 
WHERE (((tblTopic.Forum_ID = @intForumID) OR  (tblTopic.Priority = 3) OR (tblTopic.Moved_ID = @intForumID)) AND (tblTopic.Solved=0)) 
ORDER BY tblTopic.Priority DESC, tblTopic.Last_entry_date DESC;

GO
GRANT EXECUTE
	ON [dbo].[wwfSpTopicSolvedDetialsAll]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpTopicSolvedDetialsAll]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpTopicSolvedDetialsAll]
	TO [davor.dumeljic]
GO
