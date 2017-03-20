SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ICE_sp_SEO_Leads_By_Month]
(
    @StartDate datetime,
    @EndDate datetime
)
AS
BEGIN
SET @EndDate = DATEADD(day,1, @EndDate ) 
    SELECT K.[Month],
	count(*) AS Number_of_Leads
	from
	(
	 SELECT 
		YEAR(P.Download_Date)*100 + '-' +  MONTH(P.Download_Date) as [Month],
		COUNT(*) as LeadCount
		from
		(
			SELECT id.Sales_Lead_Id , id.Download_Date FROM dbo.ICE_Download_Details idd
			INNER JOIN dbo.ICE_Downloads id ON id.Download_ID = idd.Download_ID
			INNER JOIN dbo.ICE_SalesLeads isl ON isl.SalesLeadId = id.Sales_Lead_Id
			WHERE id.Download_Date BETWEEN @StartDate AND @EndDate
			UNION ALL
			SELECT ifa.AuthorID , ifd.DownloadDate FROM dbo.ICE_FakeDownload ifd
			INNER JOIN dbo.ICE_FakeAuthor ifa ON ifa.AuthorID = ifd.AuthorID
			WHERE ifd.DownloadDate BETWEEN @StartDate AND @EndDate
		) P
    GROUP BY YEAR(P.Download_Date)*100 + '-' + MONTH(P.Download_Date) , P.Sales_Lead_Id
    ) K
	GROUP BY K.[Month]
	ORDER BY [Month] 

END
GO
