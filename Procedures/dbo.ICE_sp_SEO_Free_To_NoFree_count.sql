SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ICE_sp_SEO_Free_To_NoFree_count] 
( 
@StartDate datetime, 
@EndDate datetime 
) 
AS 
BEGIN 
SET @EndDate = DATEADD(day,1, @EndDate );
		with TempData as
			(
				SELECT sl.Email, idd.Product_ID, id.Download_Date FROM dbo.ICE_Downloads id with(NOLOCK)
		INNER JOIN dbo.ICE_Download_Details idd with(NOLOCK) ON idd.Download_ID = id.Download_ID
		inner join ICE_SalesLeads sl with(NOLOCK) on sl.SalesLeadId = id.Sales_Lead_Id
		WHERE id.Download_Date >= @StartDate AND  id.Download_Date <= @EndDate
		UNION all
		SELECT fa.Email AS Email, ifd.ProductID AS Product_ID, ifd.DownloadDate AS Download_Date FROM dbo.ICE_FakeDownload ifd with(NOLOCK)
		inner join ICE_FakeAuthor fa with(NOLOCK) on fa.AuthorID = ifd.AuthorID
		WHERE ifd.DownloadDate >= @StartDate AND ifd.DownloadDate <= @EndDate
			)
		SELECT count(tk.Email) as counted
		FROM (
			select     a.Email
			from       TempData a with(NOLOCK)
			inner join TempData b with(NOLOCK)
					on a.Email = b.Email
				   and a.Download_Date < b.Download_Date
				   and b.Product_ID not in (300544515, 300467396, 300172712)
			where      a.Product_ID in (300544515, 300467396, 300172712)
			group by   a.Email
			) AS tk

END
GO
