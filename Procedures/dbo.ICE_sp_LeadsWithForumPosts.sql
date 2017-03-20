SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE  dbo.ICE_sp_LeadsWithForumPosts
(
 @DateStart datetime ,
 @DateEnd datetime 
 )
AS
BEGIN
      SELECT DISTINCT
          S.First_Name ,
          S.Last_Name ,
          S.Email ,
          S.Phone , 
	  '<a href=''http://www.apexsql.com/forum/forum_posts.asp?TID=' + CONVERT(varchar(5) , T.Topic_ID) + ''' target=''_blank''>http://www.apexsql.com/forum/forum_posts.asp?TID=' + CONVERT(varchar(5) , T.Topic_ID) + '</a>' as [Link]
      FROM
          ICE_SalesLeads S 
	  INNER JOIN tblThread T ON S.Author_ID = T.Author_ID -- this part makes sure that they have posted something in the forum so we know they have issues
	  INNER JOIN tblAuthor A on S.Author_ID = A.Author_ID
      	INNER JOIN ICE_Downloads D ON S.SalesLeadId = D.Sales_Lead_Id -- this part makes sure that lead actually downloaded something
      WHERE
          T.Message_Date BETWEEN @DateStart AND @DateEnd
	  AND A.Group_ID in (4,5,6,20)
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_LeadsWithForumPosts]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_LeadsWithForumPosts]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_LeadsWithForumPosts]
	TO [davor.dumeljic]
GO
