SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_SolvedForumPosts
(
 @DateBegin datetime ,
 @DateEnd datetime )
AS
BEGIN
      SELECT DISTINCT
          A.Author_email ,
          A.Real_name ,
          S.First_Name , --since we started with new registration system recently we dont have much data here so there will be planty null values for all data from ICE_SalesLeas table
          S.Last_Name ,
          S.Phone ,
          '<a href=''http://www.apexsql.com/forum/forum_posts.asp?TID=' + CONVERT(varchar(5) , Tp.Topic_ID) + ''' target=''_blank''>http://www.apexsql.com/forum/forum_posts.asp?TID=' + CONVERT(varchar(5) , Tp.Topic_ID) + '</a>' as [Link]
      FROM
          tblTopic Tp INNER JOIN tblThread T
          ON Tp.Topic_ID = T.Topic_ID INNER JOIN tblAuthor A
          ON T.Author_ID = A.Author_ID LEFT OUTER JOIN ICE_SalesLeads S
          ON A.Author_ID = S.Author_ID
      WHERE
          Tp.Solved = 1 AND Tp.Last_entry_date BETWEEN @DateBegin AND @DateEnd AND A.Group_ID IN ( 4 , 5 , 6 , 20 ) -- filter out our employees
      ORDER BY
          Author_email

END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SolvedForumPosts]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SolvedForumPosts]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SolvedForumPosts]
	TO [davor.dumeljic]
GO
