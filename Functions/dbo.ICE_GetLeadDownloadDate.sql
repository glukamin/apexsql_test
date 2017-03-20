SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION dbo.ICE_GetLeadDownloadDate (@salesLeadId int)
RETURNS DATETIME
AS
BEGIN
	DECLARE @result DATETIME
	SET @result = (SELECT TOP 1 D.Download_Date FROM ICE_Downloads D WHERE D.Sales_Lead_Id = @salesLeadId ORDER BY D.Download_Date)

	IF @result is null
	BEGIN
		SET @result = (SELECT TOP 1 S.Date_Added FROM ICE_SalesLeads S WHERE S.SalesLeadId = @salesLeadId)
	END
	RETURN @result
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLeadDownloadDate]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLeadDownloadDate]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_GetLeadDownloadDate]
	TO [davor.dumeljic]
GO
