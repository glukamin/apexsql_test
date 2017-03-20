SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Search_AllSalesLeads]
(
      @Sales_Lead_ID int = 0, 
      @First_Name varchar(100) = 'lasdkfjskdl',
      @Last_Name varchar(100) = 'sadfasdfg', 
      @Email varchar(100) = 'lkajsdhfalkjs@gdaf.as'
     
)
AS
BEGIN 
      SELECT 
	 *
	 FROM dbo.ICE_SalesLeads isl WITH(NOLOCK)
	 WHERE isl.SalesLeadId = @Sales_Lead_ID
	 OR isl.First_Name LIKE '%'+@First_Name+'%'
	 OR isl.Email LIKE '%'+@Email+'%'
	 OR isl.Last_Name LIKE '%'+@Last_Name+'%'
END
GO
