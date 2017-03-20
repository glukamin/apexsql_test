SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ICE_sp_QuarterToDateSales2]
AS
BEGIN
DECLARE @D datetime
SET @D = GETDATE()
EXEC dbo.ICE_sp_QuarterSales2 @Today = @D
END

GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_QuarterToDateSales2]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_QuarterToDateSales2]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_QuarterToDateSales2]
	TO [davor.dumeljic]
GO
