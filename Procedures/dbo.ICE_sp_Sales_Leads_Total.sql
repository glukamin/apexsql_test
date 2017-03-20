SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_Sales_Leads_Total
AS
BEGIN
      SELECT
          Count(*) AS Total
      FROM
          ICE_SalesLeads S INNER JOIN ICE_Downloads D
          ON S.SalesLeadId = D.Sales_Lead_Id INNER JOIN tblAuthor A
          ON S.Author_ID = A.Author_ID
      WHERE
          A.Active = 1
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Sales_Leads_Total]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Sales_Leads_Total]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Sales_Leads_Total]
	TO [davor.dumeljic]
GO
