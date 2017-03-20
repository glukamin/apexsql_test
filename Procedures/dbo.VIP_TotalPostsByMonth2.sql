SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VIP_TotalPostsByMonth2]
(
	@Begin datetime
)	
AS
BEGIN	
	SET NOCOUNT ON;
	DECLARE @End datetime	
	SET @End = GETDATE()	
	EXEC [dbo].[VIP_TotalPostsByMonth] @DateBegin = @Begin, @DateEnd = @End	
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalPostsByMonth2]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalPostsByMonth2]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalPostsByMonth2]
	TO [davor.dumeljic]
GO
