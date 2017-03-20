SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

create function dbo.ICE_LeadWebActivityScore
(
    @Sales_Lead_ID int,
    @DateFrom datetime,
    @DateTo datetime
)
returns int
as
begin    
    DECLARE @Web_Score int
    DECLARE @AuthorID int

    SELECT @AuthorID = S.Author_ID
    FROM ICE_SalesLeads S WHERE SalesLeadId = @Sales_Lead_ID

    SELECT @Web_Score = SUM(ISNULL(PS.Score, 1))
    FROM ICE_Page_Visits PV
    INNER JOIN ICE_Web_Visitors WV on PV.TrackingID = WV.Web_Visitor_ID
    FULL JOIN ICE_Page_Score PS on PV.Short_URL = PS.Page
    WHERE Wv.RegisterID = @AuthorID
    and PV.VisitTime between @DateFrom and @DateTo

    if @Web_Score is null
	   SET @Web_Score = 0
    
    return @Web_Score
end
GO
GRANT EXECUTE
	ON [dbo].[ICE_LeadWebActivityScore]
	TO [adrijan.bandu]
GO
GRANT EXECUTE
	ON [dbo].[ICE_LeadWebActivityScore]
	TO [davor.dumeljic]
GO
