SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[ICE_sp_LicensesByMonthWithBundles2]
(
 @DateBegin datetime
)
AS
BEGIN
	DECLARE @EndDate datetime
	SET @EndDate = GETDATE()
	EXEC ICE_sp_LicensesByMonthWithBundles @DateBegin=@DateBegin, @DateEnd = @EndDate
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_LicensesByMonthWithBundles2]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_LicensesByMonthWithBundles2]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_LicensesByMonthWithBundles2]
	TO [davor.dumeljic]
GO
