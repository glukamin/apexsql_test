SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE    [dbo].[VIP_TopVipsByRange]
(
	@StartDate datetime,
	@EndDate datetime
)
AS
BEGIN
	SET @EndDate = @EndDate + ' 23:59:59'
	select top 30 *
	from dbo.VIP_fn_TopVips(@StartDate,@EndDate)
END

GO
GRANT EXECUTE
	ON [dbo].[VIP_TopVipsByRange]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TopVipsByRange]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[VIP_TopVipsByRange]
	TO [davor.dumeljic]
GO
