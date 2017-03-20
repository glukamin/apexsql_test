SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpDateOfLastUnReadPM] 
(
@lngLoggedInUserID int
)
  AS 
SELECT TOP 1 tblPMMessage.PM_ID FROM tblPMMessage 
WHERE tblPMMessage.Read_Post = 0 AND tblPMMessage.Author_ID =  @lngLoggedInUserID 
ORDER BY PM_Message_Date DESC;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpDateOfLastUnReadPM]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpDateOfLastUnReadPM]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpDateOfLastUnReadPM]
	TO [davor.dumeljic]
GO
