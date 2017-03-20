SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpTopicEmailNotify] 
(
@lngAuthorID int, 
@lngTopicID int 
)
 AS 
SELECT tblEmailNotify.* 
FROM tblEmailNotify 
WHERE tblEmailNotify.Author_ID = @lngAuthorID AND tblEmailNotify.Topic_ID = @lngTopicID;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpTopicEmailNotify]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpTopicEmailNotify]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpTopicEmailNotify]
	TO [davor.dumeljic]
GO
