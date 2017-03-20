SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  dbo.VIP_TotalForumUsers
AS 
BEGIN
	SELECT Count(*) AS [Total Users] 
	FROM tblAuthor A
	WHERE (SELECT COUNT(*) FROM tblThread WHERE tblThread.Author_ID = A.Author_ID) > 0
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalForumUsers]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalForumUsers]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalForumUsers]
	TO [davor.dumeljic]
GO
