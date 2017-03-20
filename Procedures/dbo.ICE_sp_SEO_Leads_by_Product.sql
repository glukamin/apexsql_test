SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ICE_sp_SEO_Leads_by_Product]

(
	@DateBegin datetime, 
	@DateEnd datetime, 
	@Product_ID int
)
AS
BEGIN
SET @DateEnd = DATEADD(day,1, @DateEnd ) 
if(@Product_ID != 0)
	BEGIN
		select tr.Product_Name, count(Sales_Lead_Id) as countNo from (
			select ip.Product_Name, d.Sales_Lead_Id from ICE_Downloads d
			inner join ICE_Download_Details dd on d.Download_ID = dd.Download_ID
			INNER JOIN dbo.ICE_Products ip ON ip.Product_ID = dd.Product_ID
			where d.Download_Date >= @DateBegin AND d.Download_Date < @DateEnd AND dd.Product_ID = @Product_ID
			group by Product_Name, d.Sales_Lead_Id
			union all 
			SELECT ip.Product_Name, ifd.AuthorID FROM dbo.ICE_FakeDownload ifd
			INNER JOIN dbo.ICE_Products ip ON ip.Product_ID = ifd.ProductID
			WHERE  ifd.DownloadDate >= @DateBegin AND ifd.DownloadDate < @DateEnd AND ifd.ProductID = @Product_ID
			group by ip.Product_Name, ifd.AuthorID
			)as tr
			group by tr.Product_Name
			ORDER BY tr.Product_Name
	END
	ELSE 
	BEGIN
		select tr.Product_Name, count(Sales_Lead_Id) as countNo from (
			select ip.Product_Name, d.Sales_Lead_Id from ICE_Downloads d
			inner join ICE_Download_Details dd on d.Download_ID = dd.Download_ID
			INNER JOIN dbo.ICE_Products ip ON ip.Product_ID = dd.Product_ID
			where d.Download_Date >= @DateBegin AND d.Download_Date < @DateEnd
			group by Product_Name, d.Sales_Lead_Id
			union all 
			SELECT ip.Product_Name, ifd.AuthorID FROM dbo.ICE_FakeDownload ifd
			INNER JOIN dbo.ICE_Products ip ON ip.Product_ID = ifd.ProductID
			WHERE ifd.DownloadDate >= @DateBegin AND ifd.DownloadDate < @DateEnd
			group by ip.Product_Name, ifd.AuthorID
			)as tr
			group by tr.Product_Name
			ORDER BY tr.Product_Name
	END
END
GO
