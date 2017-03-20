SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE dbo.ICE_sp_Sales_Leads_Per_Period
(
 @DateStart datetime ,
 @DateEnd datetime )
AS
BEGIN
      SELECT
          dbo.ICE_GetMonthName(Year(S.Date_Added) * 100 + MONTH(S.Date_Added)) AS [Month] ,
          Count(*) AS Total
      FROM
          ICE_SalesLeads S INNER JOIN ICE_Downloads D
          ON S.SalesLeadId = D.Sales_Lead_Id INNER JOIN tblAuthor A
          ON S.Author_ID = A.Author_ID
      WHERE
          A.Active = 1 AND S.Date_Added BETWEEN @DateStart AND @DateEnd
      GROUP BY
          Year(S.Date_Added) * 100 + MONTH(S.Date_Added)
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Sales_Leads_Per_Period]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Sales_Leads_Per_Period]
	TO [apexsql]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Sales_Leads_Per_Period]
	TO [davor.dumeljic]
GO
