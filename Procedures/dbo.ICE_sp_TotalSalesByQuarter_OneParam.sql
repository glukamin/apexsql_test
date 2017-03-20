SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[ICE_sp_TotalSalesByQuarter_OneParam]
(
	@DateBegin datetime
)
AS
BEGIN
	DECLARE @DateEnd datetime
	SET @DateEnd = GETDATE()
	
	EXEC dbo.ICE_sp_TotalSalesByQuarter @DateBegin = @DateBegin, @DateEnd = @DateEnd
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalSalesByQuarter_OneParam]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalSalesByQuarter_OneParam]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_TotalSalesByQuarter_OneParam]
	TO [davor.dumeljic]
GO
