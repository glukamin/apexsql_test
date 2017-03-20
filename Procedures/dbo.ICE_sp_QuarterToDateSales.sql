SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE     [dbo].[ICE_sp_QuarterToDateSales]
AS
BEGIN
	DECLARE @D datetime
	SET @D = GETDATE()
	EXEC dbo.ICE_sp_QuarterSales @Today = @D
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_QuarterToDateSales]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_QuarterToDateSales]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_QuarterToDateSales]
	TO [davor.dumeljic]
GO
