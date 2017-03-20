SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpModeratorGroup] 
(
@intForumID int 
)
 AS 
SELECT tblGroup.Group_ID, tblGroup.Name 
FROM tblGroup, tblPermissions 
WHERE tblGroup.Group_ID = tblPermissions.Group_ID AND tblPermissions.Moderate = 1 AND tblPermissions.Forum_ID = @intForumID;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpModeratorGroup]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpModeratorGroup]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpModeratorGroup]
	TO [davor.dumeljic]
GO
