SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpAuthorDetails] 
(
@lngUserID int
)
As 
SELECT tblAuthor.* FROM tblAuthor WHERE tblAuthor.Author_ID = @lngUserID;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpAuthorDetails]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpAuthorDetails]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpAuthorDetails]
	TO [davor.dumeljic]
GO
