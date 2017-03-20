SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[wwfSpForumPermissions] 
(
@intForumID int, 
@intGroupID int, 
@intAuthorID int 
)
 AS 
SELECT tblPermissions.* 
FROM tblPermissions 
WHERE  (tblPermissions.Group_ID = @intGroupID OR tblPermissions.Author_ID = @intAuthorID) AND tblPermissions.Forum_ID = @intForumID 
ORDER BY tblPermissions.Author_ID DESC;
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumPermissions]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumPermissions]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpForumPermissions]
	TO [davor.dumeljic]
GO
