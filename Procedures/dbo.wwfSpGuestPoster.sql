SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpGuestPoster] 
(
@lngThreadID int
)
As 
SELECT tblGuestName.Name FROM tblGuestName WHERE tblGuestName.Thread_ID = @lngThreadID;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpGuestPoster]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpGuestPoster]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpGuestPoster]
	TO [davor.dumeljic]
GO
