SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[VIP_GetTopPosters]
(	
	@StartDate datetime	
)
RETURNS TABLE 
AS 
	RETURN 				
	SELECT TOP 100 percent A.UserName, Count(*) as Posts
	FROM tblAuthor A
	JOIN tblThread T on A.Author_ID = T.Author_ID
	WHERE A.Group_ID in (4/*Newbie*/,5/*Groupie*/,6/*Senior Member*/,20 /*Master Member*/,21 /*ApexSQL VIP*/) AND A.Active = 1 AND
	T.Message_date > @StartDate
	GROUP BY A.UserName
	ORDER BY Posts DESC	


GO
GRANT SELECT
	ON [dbo].[VIP_GetTopPosters]
	TO [adrijan.bandu]
GO
GRANT SELECT
	ON [dbo].[VIP_GetTopPosters]
	TO [davor.dumeljic]
GO
