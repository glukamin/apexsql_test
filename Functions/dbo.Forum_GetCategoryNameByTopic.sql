SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION dbo.Forum_GetCategoryNameByTopic
(
      @Topic_ID int 
)
RETURNS nvarchar(60)
AS
BEGIN
      DECLARE @result nvarchar(60)
      SET @result = ( SELECT
                          C.Cat_Name
                      FROM
                          tblTopic Tp JOIN tblForum F
                      ON  Tp.Forum_ID = F.Forum_ID JOIN tblCategory C
                      ON  F.Cat_ID = C.Cat_ID
                      WHERE
                          Tp.Topic_ID = @Topic_ID )
      RETURN @result
END
GO
GRANT EXECUTE
	ON [dbo].[Forum_GetCategoryNameByTopic]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[Forum_GetCategoryNameByTopic]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[Forum_GetCategoryNameByTopic]
	TO [davor.dumeljic]
GO
