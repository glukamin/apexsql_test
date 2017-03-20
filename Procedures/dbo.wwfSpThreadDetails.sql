SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpThreadDetails] 
(
@lngTopicID int
)
 AS 
SELECT  tblTopic.*, tblThread.*, tblAuthor.Username, tblAuthor.Homepage, tblAuthor.Location, tblAuthor.No_of_posts, tblAuthor.Join_date, tblAuthor.Signature, tblAuthor.Active, tblAuthor.Avatar, tblAuthor.Avatar_title, tblGroup.Name, tblGroup.Stars, tblGroup.Custom_stars 
FROM tblTopic, tblThread, tblAuthor, tblGroup 
WHERE tblTopic.Topic_ID = tblThread.Topic_ID AND tblAuthor.Author_ID = tblThread.Author_ID AND tblAuthor.Group_ID = tblGroup.Group_ID AND tblTopic.Topic_ID = @lngTopicID 
ORDER BY tblThread.Message_date ASC;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpThreadDetails]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpThreadDetails]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpThreadDetails]
	TO [davor.dumeljic]
GO
