SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpUpdateLasVisit] 
(
@lngUserID int 
)
 AS 
UPDATE tblAuthor SET tblAuthor.Last_visit=GetDate() WHERE tblAuthor.Author_ID=@lngUserID;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpUpdateLasVisit]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpUpdateLasVisit]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpUpdateLasVisit]
	TO [davor.dumeljic]
GO
