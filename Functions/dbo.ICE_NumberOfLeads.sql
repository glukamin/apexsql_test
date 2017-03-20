SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION DBO.ICE_NumberOfLeads
(
    @StartDate datetime,
    @EndDate datetime
)
returns int
AS 
BEGIN
    RETURN ( SELECT COUNT(*) 
    FROM
    (
	   SELECT DISTINCT S.SalesLeadId
	   FROM ICE_SalesLeads S
	   INNER JOIN ICE_Downloads D on S.SalesLeadId = D.Sales_Lead_Id
	   WHERE S.Date_Added BETWEEN @StartDate AND @EndDate
    ) P)
END
GO
GRANT EXECUTE
	ON [dbo].[ICE_NumberOfLeads]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_NumberOfLeads]
	TO [davor.dumeljic]
GO
