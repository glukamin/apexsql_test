SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpAuthorLastPostDate] 
(
@lngUserID int
)
As 
SELECT TOP 1 tblThread.Message_date, tblThread.Author_ID FROM tblThread  WHERE tblThread.Author_ID = @lngUserID ORDER BY tblThread.Message_date DESC;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpAuthorLastPostDate]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpAuthorLastPostDate]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpAuthorLastPostDate]
	TO [davor.dumeljic]
GO
