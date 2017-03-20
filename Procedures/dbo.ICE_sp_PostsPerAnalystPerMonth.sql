SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_PostsPerAnalystPerMonth
(
	@AuthorID int,
	@DateStart datetime,
	@DateEnd datetime
)
AS 
BEGIN
	SELECT dbo.ICE_GetMonthName(Year(Message_date) * 100 + Month(Message_date)) AS Month,
		COUNT(*) as Posts
	FROM
	tblThread T
	JOIN tblAuthor A on T.Author_ID = A.Author_ID
	WHERE A.Author_ID = @AuthorID AND T.Message_date BETWEEN @DateStart AND @DateEnd
	GROUP BY Year(Message_date) * 100 + Month(Message_date)
	
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_PostsPerAnalystPerMonth]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_PostsPerAnalystPerMonth]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_PostsPerAnalystPerMonth]
	TO [davor.dumeljic]
GO
