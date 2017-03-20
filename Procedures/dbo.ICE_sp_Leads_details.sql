SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Leads_details]
(
      @First_Name varchar(100) = 'asdf987as9d0f87a',
      @Last_Name varchar(100) = 'asdf987as9d0f87a', 
      @Email varchar(100) = 'asdf987as9d0f87a'
)
AS
BEGIN 
      SELECT 
	   isl.First_Name,
	   isl.Last_Name,
	   isl.Email,
	   isl.Date_Added,
	   (SELECT ip.Product_Name FROM dbo.ICE_Products ip WHERE ip.Product_ID = idd.Product_ID) AS product
	   FROM dbo.ICE_SalesLeads isl WITH(NOLOCK)
	   INNER JOIN dbo.ICE_Downloads id ON id.Sales_Lead_Id = isl.SalesLeadId
	   INNER JOIN dbo.ICE_Download_Details idd ON idd.Download_ID = id.Download_ID
	   WHERE isl.Email LIKE @Email OR isl.First_Name LIKE @First_Name OR isl.Last_Name LIKE @Last_Name
END
GO
