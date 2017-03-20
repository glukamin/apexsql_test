SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[VIP_fn_TopVips]
(	
	@StartDate datetime,
	@EndDate datetime	
)
RETURNS TABLE 
AS 

	RETURN 				
	SELECT TOP 200 Username , ISNULL( (SELECT SUM(Points) FROM [dbo].[ApexSQL_Points] P WHERE User_ID = A.Author_ID AND P.[Date] >= @StartDate AND P.[Date] <= ISNULL(@EndDate, GETDATE())) , 0) /*+ 
	ISNULL((SELECT Count(*) FROM [dbo].[tblThread] T WHERE T.Author_ID = A.Author_ID AND T.Message_Date >= @StartDate AND.T.Message_Date <= ISNULL(@EndDate, GETDATE())),0)*/ as Points
	FROM tblAuthor A
	WHERE A.Group_ID in (4/*Newbie*/,5/*Groupie*/,6/*Senior Member*/,20 /*Master Member*/, 21 /*ApexSQL VIP*/) AND A.Active = 'True'
	Order By Points DESC
GO
GRANT SELECT
	ON [dbo].[VIP_fn_TopVips]
	TO [adrijan.bandu]
GO
GRANT SELECT
	ON [dbo].[VIP_fn_TopVips]
	TO [davor.dumeljic]
GO
