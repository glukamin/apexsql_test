SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ICE_sp_SearLeadByDateAndProduct] 
( 
@Product_ID int, 
@DateBegin datetime, 
@DateEnd datetime 
) 
as 
BEGIN

SELECT isl.First_Name, isl.Last_Name, isl.Email, isl.Date_Added , ij.Download_Date
FROM dbo.ICE_SalesLeads isl
INNER JOIN(
SELECT id.Download_ID, id.Download_Date, id.Sales_Lead_Id
FROM dbo.ICE_Downloads id
INNER JOIN(
SELECT *
FROM dbo.ICE_Download_Details idd
WHERE idd.Product_ID = @Product_ID
)br ON id.Download_ID = br.Download_ID
WHERE id.Download_Date > @DateBegin AND id.Download_Date < @DateEnd
) ij ON isl.SalesLeadId = ij.Sales_Lead_Id
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SearLeadByDateAndProduct]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_SearLeadByDateAndProduct]
	TO [davor.dumeljic]
GO
