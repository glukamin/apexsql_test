SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VIP_TotalPostsByMonth_with_Apex2]
(
	@Begin datetime
)	
AS
BEGIN	
	SET NOCOUNT ON;
	DECLARE @End datetime	
	SET @End = GETDATE()	
	EXEC [dbo].[VIP_TotalPostsByMonth_with_Apex] @DateBegin = @Begin, @DateEnd = @End	
END
GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalPostsByMonth_with_Apex2]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalPostsByMonth_with_Apex2]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TotalPostsByMonth_with_Apex2]
	TO [davor.dumeljic]
GO
