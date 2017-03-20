SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION dbo.Forum_GetCategoryIDByTopic
(
      @Topic_ID int 
)
RETURNS int
AS
BEGIN
      DECLARE @result int
      SET @result = ( SELECT
                          C.Cat_ID
                      FROM
                          tblTopic Tp 
			  JOIN tblForum F ON  Tp.Forum_ID = F.Forum_ID 
			  JOIN tblCategory C ON  F.Cat_ID = C.Cat_ID
                      WHERE
                          Tp.Topic_ID = @Topic_ID )
      RETURN @result
END
GO
GRANT EXECUTE
	ON [dbo].[Forum_GetCategoryIDByTopic]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[Forum_GetCategoryIDByTopic]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[Forum_GetCategoryIDByTopic]
	TO [davor.dumeljic]
GO
