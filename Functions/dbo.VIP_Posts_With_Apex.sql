SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[VIP_Posts_With_Apex]
(	
	@DateBegin datetime,
	@DateEnd datetime
)
RETURNS TABLE 
AS 
	RETURN 				
	SELECT TOP 100 PERCENT (Year(T.Message_date) * 100 + Month(T.Message_date)) as Month, Count(*) as Count
	FROM tblThread T
	JOIN tblAuthor A on T.Author_ID = A.Author_ID 
	WHERE --A.Group_ID in (4/*Newbie*/,5/*Groupie*/,6/*Senior Member*/,20 /*Master Member*/) AND A.Active = 1 AND
	T.Message_date > @DateBegin AND T.Message_date < @DateEnd
	GROUP BY Year(T.Message_date) * 100 + Month(T.Message_date)
	ORDER BY Year(T.Message_date) * 100 + Month(T.Message_date) 


GO
GRANT SELECT
	ON [dbo].[VIP_Posts_With_Apex]
	TO [adrijan.bandu]
GO
GRANT SELECT
	ON [dbo].[VIP_Posts_With_Apex]
	TO [davor.dumeljic]
GO
