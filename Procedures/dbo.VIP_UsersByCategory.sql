SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[VIP_UsersByCategory]

AS 
BEGIN
	SELECT Count(*) AS [Number Of Users], G.Name AS [Group]
	FROM tblAuthor A
	JOIN tblGroup G ON A.Group_ID = G.Group_ID		
	WHERE A.Group_ID in (4/*Newbie*/ ,5/*Groupie*/, 6/*Senior Member*/, 20/*Master Member*/) AND A.Active = 1 
	AND (SELECT Count(*) FROM tblThread where tblThread.Author_ID = A.Author_ID) > 0
	GROUP BY G.Name, A.Group_ID	
	ORDER BY A.Group_ID	
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_UsersByCategory]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_UsersByCategory]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_UsersByCategory]
	TO [davor.dumeljic]
GO
