SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpPollDetails] 
(
@lngPollID int
)
 AS 
SELECT  tblPoll.*, tblPollChoice.* 
FROM tblPoll INNER JOIN tblPollChoice ON tblPoll.Poll_ID = tblPollChoice.Poll_ID 
WHERE (((tblPoll.Poll_ID)=@lngPollID));
GO
GRANT EXECUTE
	ON [dbo].[wwfSpPollDetails]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpPollDetails]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpPollDetails]
	TO [davor.dumeljic]
GO
