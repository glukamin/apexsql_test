SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[VIP_UserDiversity]
AS 
BEGIN
	SELECT Count(*) [Users posting in more than 3 forums]
	FROM
	(
		SELECT TOP 100 PERCENT T.Author_ID
		FROM
		(
			SELECT DISTINCT TOP 100 PERCENT  F.Forum_ID, A.Author_ID
			FROM tblAuthor A 
			JOIN tblThread T ON	T.Author_ID = A.Author_ID
			JOIN tblTopic Tp ON T.Topic_ID = Tp.Topic_ID
			JOIN tblForum F ON Tp.Forum_ID = F.Forum_ID
			WHERE A.Group_ID in (4/*Newbie*/ ,5/*Groupie*/, 6/*Senior Member*/, 20/*Master Member*/)
			GROUP BY F.Forum_ID, A.Author_ID	
		) T
		GROUP BY T.Author_ID 
		HAVING Count(*) > 3
	) P	
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_UserDiversity]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_UserDiversity]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_UserDiversity]
	TO [davor.dumeljic]
GO
