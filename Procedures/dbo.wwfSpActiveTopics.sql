SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpActiveTopics] 
(
@AuthorID int, 
@GroupID int, 
@GroupPerm int, 
@dblActiveFrom datetime
)
 AS 
SELECT tblForum.Forum_name, tblForum.Password, tblForum.Forum_code, tblTopic.* 
FROM tblCategory, tblForum, tblTopic 
WHERE ((tblCategory.Cat_ID = tblForum.Cat_ID AND tblForum.Forum_ID = tblTopic.Forum_ID) AND (tblTopic.Last_entry_date > GetDate() - @dblActiveFrom)) 
AND (tblForum.[Read] <= @GroupPerm OR (tblTopic.Forum_ID IN (
	SELECT tblPermissions.Forum_ID 
	FROM tblPermissions 
	WHERE tblPermissions.Author_ID = @AuthorID OR tblPermissions.Group_ID = @GroupID AND tblPermissions.[Read]=1))
	)
ORDER BY tblCategory.Cat_order ASC, tblForum.Forum_Order ASC, tblTopic.Last_entry_date DESC;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpActiveTopics]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpActiveTopics]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpActiveTopics]
	TO [davor.dumeljic]
GO
