SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.Forum_sp_ForumCategories
AS
BEGIN
      SELECT
          *
      FROM
          tblCategory
      ORDER BY
          tblCategory.Cat_name
END
GO
GRANT EXECUTE
	ON [dbo].[Forum_sp_ForumCategories]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[Forum_sp_ForumCategories]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[Forum_sp_ForumCategories]
	TO [davor.dumeljic]
GO
