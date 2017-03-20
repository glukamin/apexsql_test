SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE  [dbo].[VIP_ActiveForumUsers]
AS 
BEGIN
	SELECT top 50 Username AS [User Name]
,Count(*) AS [Number of posts in last 2 months]
,(SELECT TOP 1 Message_date FROM tblThread WHERE tblThread.Author_ID = T.Author_ID ORDER BY tblThread.Message_date DESC) AS [Last Post]
	FROM tblAuthor A
	JOIN tblThread T ON A.Author_ID = T.Author_ID
	WHERE T.Message_date > dbo.VIP_DateSubstract(getdate(), 0 ,2 ,0)
	AND A.Group_ID in (2/*Guest*/,4/*Newbie*/ ,5/*Groupie*/, 6/*Senior Member*/, 20/*Master Member*/) AND A.Active = 1
	GROUP BY A.Username, T.Author_ID
	ORDER BY [Number of posts in last 2 months] DESC  
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_ActiveForumUsers]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_ActiveForumUsers]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_ActiveForumUsers]
	TO [davor.dumeljic]
GO
