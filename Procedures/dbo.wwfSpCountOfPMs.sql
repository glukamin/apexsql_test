SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpCountOfPMs] 
(
@lngLoggedInUserID int
)
  AS 
SELECT Count(tblPMMessage.PM_ID) AS CountOfPM FROM tblPMMessage 
WHERE tblPMMessage.Read_Post = 0 AND tblPMMessage.Author_ID = @lngLoggedInUserID 
GO
GRANT EXECUTE
	ON [dbo].[wwfSpCountOfPMs]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpCountOfPMs]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpCountOfPMs]
	TO [davor.dumeljic]
GO
