SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ICE_sp_Leads_By_Month]
(
    @StartDate datetime,
    @EndDate datetime
)
AS
BEGIN
    SELECT 
    YEAR(P.Date_Added)*100 + '-' +  MONTH(P.Date_Added) as [Month],
    COUNT(*) as LeadCount
    from
    (
	   SELECT DISTINCT S.SalesLeadId, S.Date_Added
	   FROM ICE_SalesLeads S
	   INNER JOIN ICE_Downloads D on S.SalesLeadId = D.Sales_Lead_Id
	   WHERE S.Date_Added BETWEEN @StartDate AND @EndDate
    ) P
    GROUP BY YEAR(P.Date_Added)*100 + '-' + MONTH(P.Date_Added)
    ORDER BY [Month] 
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Leads_By_Month]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_sp_Leads_By_Month]
	TO [davor.dumeljic]
GO
