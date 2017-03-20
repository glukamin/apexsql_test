SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [wwfSpAuthorDesc] AS 
SELECT a.Username,a.Author_ID, b.UserCount  FROM 
(SELECT TOP 1 Username, Author_ID, 1 AS join_id FROM tblAuthor ORDER BY join_date DESC) a,
(SELECT isnull(count(Author_ID),0) AS UserCount, 1 AS join_id  FROM tblAuthor) b
WHERE a.join_id = b.join_id
GO
GRANT EXECUTE
	ON [dbo].[wwfSpAuthorDesc]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpAuthorDesc]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[wwfSpAuthorDesc]
	TO [davor.dumeljic]
GO
