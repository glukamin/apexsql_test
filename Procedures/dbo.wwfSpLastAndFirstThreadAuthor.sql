SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpLastAndFirstThreadAuthor] 
( 
@lngTopicID int 
) 
 AS 
SELECT tblThread.Thread_ID, tblThread.Author_ID, tblThread.Message, tblThread.Message_date, tblAuthor.Username 
FROM tblAuthor, tblThread 
WHERE tblAuthor.Author_ID = tblThread.Author_ID AND tblThread.Topic_ID = @lngTopicID 
ORDER BY tblThread.Message_date ASC;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpLastAndFirstThreadAuthor]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpLastAndFirstThreadAuthor]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpLastAndFirstThreadAuthor]
	TO [davor.dumeljic]
GO
