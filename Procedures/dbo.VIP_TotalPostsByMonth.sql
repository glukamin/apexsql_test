SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VIP_TotalPostsByMonth]
(
	@DateBegin datetime,
	@DateEnd datetime
)	
AS
BEGIN	
	SET NOCOUNT ON;
	
    SELECT dbo.ICE_GetMonthName(Year(T.Message_date) * 100 + Month(T.Message_date)) as Month, Count(*) as Count
	FROM tblThread T
	JOIN tblAuthor A on T.Author_ID = A.Author_ID 
	WHERE A.Group_ID in (4/*Newbie*/,5/*Groupie*/,6/*Senior Member*/,20 /*Master Member*/) AND A.Active = 1 AND
	T.Message_date > @DateBegin AND T.Message_date < @DateEnd
	GROUP BY Year(T.Message_date) * 100 + Month(T.Message_date)
	ORDER BY Year(T.Message_date) * 100 + Month(T.Message_date) 
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalPostsByMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalPostsByMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalPostsByMonth]
	TO [davor.dumeljic]
GO
