SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Fourm_sp_UnansweredTopics]
(
	@DateStart datetime, 
	@DateEnd datetime 
)
AS
BEGIN	
SELECT dbo.Forum_GetCategoryNameByTopic(T.Topic_ID) AS Product,
		Topic,
		dbo.Forum_GetLastMessage(T.Topic_ID, 60)
FROM
(
SELECT DISTINCT T.Topic_ID,
          '<a href="http://www.apexsql.com/forum/forum_posts.asp?TID=' + CONVERT(varchar,T.Topic_ID) + '" target="_blank">http://www.apexsql.com/forum/forum_posts.asp?TID=' + CONVERT(varchar,T.Topic_ID) + '</a>'  AS Topic
FROM tblThread T
WHERE (T.Message_Date BETWEEN @DateStart and @DateEnd) and dbo.Forum_IsLastThreadFromApex(T.Topic_ID) = 0
) T
END
GO
GRANT EXECUTE
	ON [dbo].[Fourm_sp_UnansweredTopics]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[Fourm_sp_UnansweredTopics]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[Fourm_sp_UnansweredTopics]
	TO [davor.dumeljic]
GO
