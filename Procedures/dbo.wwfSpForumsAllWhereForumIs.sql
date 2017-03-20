SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpForumsAllWhereForumIs] 
( 
@intForumID int 
) 
 AS 
SELECT tblForum.* FROM tblForum WHERE Forum_ID = @intForumID;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumsAllWhereForumIs]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumsAllWhereForumIs]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumsAllWhereForumIs]
	TO [davor.dumeljic]
GO
