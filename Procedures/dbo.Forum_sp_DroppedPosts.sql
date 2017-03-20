SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE   [dbo].[Forum_sp_DroppedPosts]
(
 @DateStart datetime ,
 @DateEnd datetime ,
 @HoursDelay int = 24
)
AS
BEGIN
      SELECT DISTINCT
          dbo.Forum_GetCategoryNameByTopic(T1.Topic_ID) AS Product ,
          '<a href="http://www.apexsql.com/forum/forum_posts.asp?TID=' + CONVERT(varchar(6), T1.Topic_ID) + '" target="_blank">http://www.apexsql.com/forum/forum_posts.asp?TID=' + CONVERT(VARCHAR(6), T1.Topic_ID) + '</a>'  AS Topic ,
          ROUND(CONVERT(real , DATEDIFF(hh , T1.Message_date , T2.Message_date)) / 24 , 2) AS Days_Delay,
	  [Message Sample] = CASE 
	  	WHEN LEN(CONVERT(VARCHAR(MAX), T1.[Message])) > 60 THEN SUBSTRING(T1.[Message], 1, 60) 
		ELSE CONVERT(VARCHAR(MAX), T1.[Message]) 
	  END
      FROM
          tblThread T1
      JOIN tblThread T2
      ON  T1.Topic_ID = T2.Topic_ID
      JOIN tblAuthor A2
      ON  T2.Author_ID = A2.Author_ID
      JOIN tblAuthor A1
      ON  T1.Author_ID = A1.Author_ID
      WHERE
          DATEDIFF(hh , T1.Message_date , T2.Message_date) > @HoursDelay
          AND A2.Group_ID NOT IN ( 4 , 5 , 6 , 20 )
          AND A1.Group_ID IN ( 4 , 5 , 6 , 20 )
          AND A1.Active = 'True'
          /*AND NOT EXISTS ( SELECT
                               *
                           FROM
                               tblThread T
                           WHERE
                               T.Topic_ID = T1.Topic_ID
                               AND T.Message_date > T1.Message_date
                               AND T.Message_date < T2.Message_date )*/
	  AND NOT EXISTS ( SELECT
                               *
                           FROM
                               tblThread T
                           WHERE
                               T.Topic_ID = T1.Topic_ID
                               AND T.Message_date < T1.Message_date
                               AND T.Message_date > T2.Message_date )
	AND (select isnull(Solved,'False') from tblTopic where tblTopic.Topic_ID = T1.Topic_ID) = 'False'
          AND T1.Message_date BETWEEN @DateStart
          AND @DateEnd
      ORDER BY
      Days_Delay DESC
END

GO
GRANT EXECUTE
	ON [dbo].[Forum_sp_DroppedPosts]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[Forum_sp_DroppedPosts]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[Forum_sp_DroppedPosts]
	TO [davor.dumeljic]
GO
