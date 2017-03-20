SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[VIP_GetPostsForProduct]
(
	@CategoryID int,
	@StartDate datetime,
	@EndDate datetime
)
RETURNS int
AS
BEGIN
	DECLARE @Result int
	
	SET @Result = ( SELECT COUNT(*) Count
	FROM tblThread Th	
	WHERE Th.Message_date > @StartDate AND Th.Message_date < @EndDate
	AND Th.Topic_ID in 
				( 
					SELECT Topic_ID 
					FROM tblTopic 
					WHERE Forum_ID in 
						(
							SELECT Forum_ID 
							FROM tblForum   
							WHERE Cat_ID = @CategoryID
						)
				)
	)	
	RETURN @Result
END


GO
GRANT EXECUTE
	ON [dbo].[VIP_GetPostsForProduct]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_GetPostsForProduct]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_GetPostsForProduct]
	TO [davor.dumeljic]
GO
