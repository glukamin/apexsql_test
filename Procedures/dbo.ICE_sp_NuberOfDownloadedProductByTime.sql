SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_NuberOfDownloadedProductByTime]
(
    @StartDate datetime,
    @EndDate datetime
)
AS
BEGIN
   
SELECT (select ip.Product_Name from dbo.ICE_Products ip where ip.Product_ID = idd.Product_ID) AS Product, count(*) AS Downloads_No FROM dbo.ICE_Download_Details idd
INNER JOIN dbo.ICE_Downloads id ON id.Download_ID = idd.Download_ID
WHERE id.Download_Date BETWEEN @StartDate AND @EndDate
GROUP BY idd.Product_ID
END
GO
