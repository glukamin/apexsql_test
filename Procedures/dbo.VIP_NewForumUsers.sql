SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE  [dbo].[VIP_NewForumUsers]
(
	@DateBegin datetime
)
AS 
BEGIN
	SELECT dbo.ICE_GetMonthName(Year(A.Join_Date) * 100 + Month(A.Join_Date)) AS Month,
	Count(*) AS [New Users]
	FROM tblAuthor A
	WHERE A.Group_ID in (2/*Guest*/,4/*Newbie*/ ,5/*Groupie*/, 6/*Senior Member*/, 20/*Master Member*/)
	AND (SELECT COUNT(*) FROM tblThread WHERE tblThread.Author_ID = A.Author_ID) > 0
	AND Join_Date BETWEEN @DateBegin and GETDATE()
	GROUP BY Year(A.Join_Date) * 100 + Month(A.Join_Date)
	ORDER BY Year(A.Join_Date) * 100 + Month(A.Join_Date)	
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_NewForumUsers]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_NewForumUsers]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_NewForumUsers]
	TO [davor.dumeljic]
GO
