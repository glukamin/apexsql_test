SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpForumsAllWhereCatIs] 
(
@intCatID smallint
)
 AS 
SELECT tblForum.* FROM tblForum WHERE tblForum.Cat_ID = @intCatID ORDER BY tblForum.Forum_Order ASC;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumsAllWhereCatIs]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumsAllWhereCatIs]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumsAllWhereCatIs]
	TO [davor.dumeljic]
GO
