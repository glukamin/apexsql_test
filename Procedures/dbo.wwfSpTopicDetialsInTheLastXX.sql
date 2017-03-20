SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpTopicDetialsInTheLastXX] 
( 
@intForumID int, 
@intShowTopicsFrom int 
) 
 AS 
SELECT tblTopic.Topic_ID, tblTopic.Moved_ID, tblTopic.No_of_views, tblTopic.Subject, tblTopic.Poll_ID, tblTopic.Locked, tblTopic.Priority FROM tblTopic 
WHERE (((tblTopic.Forum_ID = @intForumID) OR (tblTopic.Moved_ID = @intForumID)) AND ((tblTopic.Last_entry_date > GetDate() - @intShowTopicsFrom) OR (tblTopic.Priority > 0))) OR  (tblTopic.Priority = 3) 
ORDER BY tblTopic.Priority DESC, tblTopic.Last_entry_date DESC;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpTopicDetialsInTheLastXX]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpTopicDetialsInTheLastXX]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpTopicDetialsInTheLastXX]
	TO [davor.dumeljic]
GO
