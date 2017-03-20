SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[ICE_sp_SEO_Leads_Download_Details] 
( 
@StartDate datetime, 
@EndDate datetime 
) 
AS 
BEGIN 
SET @EndDate = DATEADD(day,1, @EndDate ) 
SELECT * FROM (
		SELECT isl.SalesLeadId, idd.Product_ID, id.Download_Date, 'No' as fake FROM dbo.ICE_SalesLeads isl
		INNER JOIN dbo.ICE_Downloads id ON id.Sales_Lead_Id = isl.SalesLeadId
		INNER JOIN dbo.ICE_Download_Details idd ON idd.Download_ID = id.Download_ID
		WHERE id.Download_Date BETWEEN @StartDate AND @EndDate
		UNION
		SELECT ifa.AuthorID AS SalesLeadID, ifd.ProductID AS Product_ID, ifd.DownloadDate AS Download_Date, 'Yes' as fake FROM dbo.ICE_FakeAuthor ifa
		INNER JOIN dbo.ICE_FakeDownload ifd ON ifd.AuthorID = ifa.AuthorID
		WHERE ifd.DownloadDate BETWEEN @StartDate AND @EndDate
		)AS sk
	ORDER BY sk.SalesLeadId
END
GO
