SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_GetLatestDownloadDetails
(
	@SalesLeadId int
)
AS
BEGIN
	SELECT TOP 1 D.Download_Date, P.Product_Name
	FROM ICE_Downloads D
	INNER JOIN ICE_Download_Details DD on D.Download_ID = DD.Download_ID
	INNER JOIN ICE_Products P on DD.Product_ID = P.Product_ID
	WHERE D.Sales_Lead_Id = @SalesLeadId
	ORDER BY D.Download_Date DESC
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetLatestDownloadDetails]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetLatestDownloadDetails]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_GetLatestDownloadDetails]
	TO [davor.dumeljic]
GO
