SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VIP_TotalPostsLastTwoYears]
AS
BEGIN	
	SET NOCOUNT ON;
	DECLARE @Begin datetime
	DECLARE @End datetime
	SET @Begin = dbo.VIP_DateSubstract(GETDATE(),2,0,0)
	SET @End = GETDATE()
	EXEC VIP_TotalPostsByMonth @DateBegin = @Begin, @DateEnd = @End
    
END

GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalPostsLastTwoYears]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalPostsLastTwoYears]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalPostsLastTwoYears]
	TO [davor.dumeljic]
GO
